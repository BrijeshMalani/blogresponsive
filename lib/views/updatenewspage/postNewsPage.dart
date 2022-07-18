import 'dart:io';
import 'dart:typed_data';

import 'package:blogresponsive/constant/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:uuid/uuid.dart';

import '../../comman/textfield.dart';

class PostNewsPage extends StatefulWidget {
  const PostNewsPage({Key? key}) : super(key: key);

  @override
  State<PostNewsPage> createState() => _PostNewsPageState();
}

class _PostNewsPageState extends State<PostNewsPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final _formkey = GlobalKey<FormState>();

  var id = '';
  var title = '';
  var shortdesc = '';
  var longdesc = '';

  final ntitleController = TextEditingController();
  final nshortdescController = TextEditingController();
  final nlongdescController = TextEditingController();

  // String? _fileName;
  // List<PlatformFile>? _paths;
  // String? _directoryPath;
  // String? _extension;
  // bool _loadingPath = false;
  // bool _multiPick = false;
  // FileType _pickingType = FileType.any;
  // TextEditingController _controller = TextEditingController();
  //
  // void _openFileExplorer() async {
  //   setState(() => _loadingPath = true);
  //   try {
  //     _directoryPath = null;
  //     _paths = (await FilePicker.platform.pickFiles(
  //       type: _pickingType,
  //       allowMultiple: _multiPick,
  //       allowedExtensions: (_extension?.isNotEmpty ?? false)
  //           ? _extension?.replaceAll(' ', '').split(',')
  //           : null,
  //     ))
  //         ?.files;
  //   } on PlatformException catch (e) {
  //     print("Unsupported operation" + e.toString());
  //   } catch (ex) {
  //     print(ex);
  //   }
  //   if (!mounted) return;
  //   setState(() {
  //     _loadingPath = false;
  //     print(_paths!.first.extension);
  //     _fileName =
  //         _paths != null ? _paths!.map((e) => e.name).toString() : '...';
  //   });
  // }
  //
  // void _clearCachedFiles() {
  //   FilePicker.platform.clearTemporaryFiles().then((result) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         backgroundColor: result! ? Colors.green : Colors.red,
  //         content: Text((result
  //             ? 'Temporary files removed with success.'
  //             : 'Failed to clean temporary files')),
  //       ),
  //     );
  //   });
  // }
  //
  // void _selectFolder() {
  //   FilePicker.platform.getDirectoryPath().then((value) {
  //     setState(() => _directoryPath = value);
  //   });
  // }
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _controller.addListener(() => _extension = _controller.text);
  // }

  @override
  void dispose() {
    ntitleController.dispose();
    nshortdescController.dispose();
    nlongdescController.dispose();
    super.dispose();
  }

  clearText() {
    id = "";
    ntitleController.clear();
    nshortdescController.clear();
    nlongdescController.clear();
  }

  final Stream<QuerySnapshot> newsStream =
      FirebaseFirestore.instance.collection('newspost').snapshots();

  CollectionReference newspost =
      FirebaseFirestore.instance.collection('newspost');

  Future<void> addNews() {
    return newspost
        .add({
          'title': title,
          'shortdesc': shortdesc,
          'longdesc': longdesc,
        })
        .then((value) => print("News Added"))
        .then((value) => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('News Added'))))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> updateUser(id, title, shortdesc, longdesc) {
    print("User update");
    return newspost
        .doc(id)
        .update({
          'title': title,
          'shortdesc': shortdesc,
          'longdesc': longdesc,
        })
        .then((value) => print("News Updated"))
        .catchError((error) => print("Failed to update news: $error"));
  }

  Future<void> deleteUser(id) {
    return newspost
        .doc(id)
        .delete()
        .then((value) => print("User Deleted"))
        .then((value) => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('News deleted'))))
        .catchError((error) => print("Failed to delete news: $error"))
        .catchError((onError) => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Failed to delete news: $onError"))));
  }

  ///=====image send=====
  File? imageFile;

  //for get image from gallery
  Future getImage() async {
    ImagePicker _picker = ImagePicker();

    await _picker.pickImage(source: ImageSource.gallery).then((xFile) {
      if (xFile != null) {
        imageFile = File(xFile.path);
        print(imageFile);
        // uploadImage();
      }
    });
  }

  Future uploadImage() async {
    String fileName = Uuid().v1();
    int status = 1;

    await _firestore
        .collection('newsimage')
        .doc("$imageFile")
        .collection('post')
        .doc(fileName)
        .set({
      "sendby": imageFile,
      "message": "",
      "type": "img",
      "time": FieldValue.serverTimestamp(),
    });

    var ref =
        FirebaseStorage.instance.ref().child('images').child("$fileName.jpg");

    var uploadTask = await ref.putFile(imageFile!).catchError((error) async {
      await _firestore
          .collection('newsimage')
          .doc("$imageFile")
          .collection('post')
          .doc(fileName)
          .delete();

      status = 0;
    });

    if (status == 1) {
      String imageUrl = await uploadTask.ref.getDownloadURL();

      await _firestore
          .collection('newsimage')
          .doc("$imageFile")
          .collection('post')
          .doc(fileName)
          .update({"message": imageUrl});

      print(imageUrl);
    }
  }

  /// 2 image

  File _file = File("zz");
  Uint8List webImage = Uint8List(10);
  Uint8List? pickedFileBytes;
  Uint8List? pickedFileBytes1;
  String? uploadedPhotoUrl;
  var pickedFile;

  chooseImage() async {
    pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    // pickedFile = await ImagePickerWeb.getImageAsBytes();
    pickedFileBytes = await pickedFile!.readAsBytes();
    setState(() {
      _file = File("a");
      webImage = pickedFileBytes!;
    });
    print(pickedFile);
    // uploadImageToStorage(pickedFile);
  }

//   uploadImageToStorage(var pickedFile) async {
//     if (kIsWeb) {
//       Reference _reference = FirebaseStorage.instance
//           .ref()
//           .child('images/${Path.basename(pickedFile!.path)}');
//       await _reference
//           .putData(
//         await pickedFile!.readAsBytes(),
//         SettableMetadata(contentType: 'image/jpeg'),
//       )
//           .whenComplete(() async {
//         await _reference.getDownloadURL().then((value) {
//           uploadedPhotoUrl = value;
//           print('uploadedPhotoUrl--------${uploadedPhotoUrl}');
//         });
//       });
//     } else {
// //write a code for android or ios
//     }
//   }

  bool showButton = false;

  @override
  Widget build(BuildContext context) {
    final kwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(height: kwidth * 0.01),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: GestureDetector(
                          onTap: () {
                            chooseImage();
                            // getImage();
                          },
                          child: Container(
                            height: 100,
                            width: 100,
                            // decoration: BoxDecoration(
                            //   image: DecorationImage(
                            //     image: Image.memory(imageFile),
                            //   ),
                            // ),
                            color: Colors.grey,
                            child: Center(
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: kwidth * 0.01),
                      Container(
                        height: 55,
                        width: 400,
                        child: CommonTextField(
                          obSecure: false,
                          hint: "enter post title",
                          label: "title",
                          controller: ntitleController,
                        ),
                      ),
                      SizedBox(height: kwidth * 0.01),
                      Container(
                        height: 60,
                        width: 400,
                        child: CommonTextField(
                          obSecure: false,
                          hint: "enter post short description",
                          label: "short description",
                          controller: nshortdescController,
                        ),
                      ),
                      SizedBox(height: kwidth * 0.01),
                      Container(
                        height: 65,
                        width: 400,
                        child: CommonTextField(
                          obSecure: false,
                          hint: "enter post long description",
                          label: "long Description",
                          controller: nlongdescController,
                        ),
                      ),
                      SizedBox(height: kwidth * 0.01),
                      MaterialButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            setState(() {
                              title = ntitleController.text;
                              shortdesc = nshortdescController.text;
                              longdesc = nlongdescController.text;
                              addNews();
                              clearText();
                            });
                          }
                        },
                        height: 50,
                        minWidth: 300,
                        color: kTheamColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(color: kTheamColor),
                        ),
                        child: Text(
                          'Post',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(height: kwidth * 0.01),
                      MaterialButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            setState(
                              () {
                                title = ntitleController.text;
                                shortdesc = nshortdescController.text;
                                longdesc = nlongdescController.text;
                                updateUser(id, title, shortdesc, longdesc);
                                clearText();
                              },
                            );
                          }
                        },
                        height: 50,
                        minWidth: 300,
                        color: kTheamColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(color: kTheamColor),
                        ),
                        child: Text(
                          'Update Post',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          StreamBuilder<QuerySnapshot>(
                            stream: newsStream,
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.hasData) {
                                return Padding(
                                  padding: EdgeInsets.all(kwidth / 180),
                                  child: Container(
                                    height: 600,
                                    child: MasonryGridView.count(
                                      itemCount: snapshot.data?.docs.length,
                                      crossAxisCount: 3,
                                      mainAxisSpacing: 4,
                                      crossAxisSpacing: 4,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onDoubleTap: () {
                                            id =
                                                "${snapshot.data!.docs[index].id}";
                                            title =
                                                "${snapshot.data!.docs[index]["title"]}";
                                            shortdesc =
                                                "${snapshot.data!.docs[index]["shortdesc"]}";
                                            longdesc =
                                                "${snapshot.data?.docs[index]['longdesc']}";

                                            print(
                                                "${snapshot.data!.docs[index].id}");
                                            print(
                                                "${snapshot.data!.docs[index]["title"]}");
                                            print(
                                                "${snapshot.data!.docs[index]["shortdesc"]}");
                                            print(
                                                "${snapshot.data?.docs[index]['longdesc']}");
                                          },
                                          onLongPress: () {
                                            deleteUser(
                                                "${snapshot.data?.docs[index].id}");
                                          },
                                          child: Container(
                                            padding:
                                                EdgeInsets.all(kwidth / 180),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.white),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                // Image.network(
                                                //     "${snapshot.data?.docs[index]['imgurl']}"),
                                                SizedBox(height: kwidth * 0.01),
                                                Text(
                                                  "${snapshot.data?.docs[index]['title']}",
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: kwidth / 80,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(height: kwidth * 0.01),
                                                Text(
                                                  "${snapshot.data?.docs[index]['shortdesc']}",
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: kwidth / 90,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                SizedBox(height: kwidth * 0.01),
                                                Text(
                                                  "${snapshot.data?.docs[index]['longdesc']}",
                                                  maxLines: 4,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: kwidth / 100,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                );
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
