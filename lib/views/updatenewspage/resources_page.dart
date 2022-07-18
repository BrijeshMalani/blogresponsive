import 'package:blogresponsive/Api_controller/news_controller.dart';
import 'package:blogresponsive/constant/constants.dart';
import 'package:blogresponsive/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Api_res_model/newsGModel.dart';
import '../../Api_res_model/newsGModel.dart';

class ResourcesPage extends StatefulWidget {
  const ResourcesPage({Key? key}) : super(key: key);

  @override
  State<ResourcesPage> createState() => _ResourcesPageState();
}

class _ResourcesPageState extends State<ResourcesPage> {
  NewsController _newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    print(MediaQuery.of(context).size.height);

    final kwidth = MediaQuery.of(context).size.width;

    int selector = 0;
    int count = 0;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: kwidth / 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: kwidth / 3,
                  height: kwidth / 5,
                  padding: EdgeInsets.all(kwidth * 0.01),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 25.0, // soften the shadow
                        spreadRadius: 5.0, //extend the shadow
                        offset: Offset(
                          15.0, // Move to right 10  horizontally
                          15.0, // Move to bottom 10 Vertically
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Image(
                            image: AssetImage("assets/png/Logoo.png"),
                            height: kwidth / 32,
                            width: kwidth / 32,
                          ),
                          SizedBox(width: kwidth / 150),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hello Noberto",
                                style: TextStyle(
                                    fontSize: kwidth / 60,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                              ),
                              SizedBox(height: kwidth / 150),
                              Text(
                                "What’s news today? Share an update, link or news article \nwith your connections. Get out there!",
                                style: TextStyle(
                                    fontSize: kwidth / 100,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: kwidth / 90),
                      Row(
                        children: [
                          Image(
                            image: AssetImage("assets/png/Avatar.png"),
                            height: kwidth / 32,
                            width: kwidth / 32,
                          ),
                          Container(
                            height: kwidth / 35,
                            width: kwidth / 4.378,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Center(
                              child: TextField(
                                style: TextStyle(
                                    fontSize: kwidth / 80, color: Colors.black),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: kwidth * 0.01),
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: kwidth / 100),
                                  hintText: 'share an update...',
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: kwidth / 90),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          MaterialButton(
                            onPressed: () {},
                            color: kTheamColor,
                            minWidth: 0,
                            height: kwidth / 30,
                            child: Text(
                              "Post Update",
                              style: TextStyle(
                                  fontSize: kwidth / 90, color: Colors.white),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: kwidth / 3,
                  height: kwidth / 5,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 25.0, // soften the shadow
                        spreadRadius: 5.0, //extend the shadow
                        offset: Offset(
                          15.0, // Move to right 10  horizontally
                          15.0, // Move to bottom 10 Vertically
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: kwidth / 5,
                          color: Colors.indigo,
                          child: Align(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "25 %",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: kwidth / 40),
                                ),
                                SizedBox(height: kwidth / 90),
                                LinearProgressIndicator(
                                  // value: _controller.value,
                                  minHeight: kwidth / 200,
                                  backgroundColor: Colors.redAccent,
                                ),
                                SizedBox(height: kwidth / 90),
                                Text(
                                  "Your Profile Is \n25 % complite",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: kwidth / 90),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(kwidth / 70),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Where did you work before your current job?",
                                style: TextStyle(
                                    fontSize: kwidth / 90,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                              ),
                              SizedBox(height: kwidth / 150),
                              Text(
                                "your work history shows your career path\n and experience in the industry.",
                                style: TextStyle(
                                    fontSize: kwidth / 100,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey),
                              ),
                              SizedBox(height: kwidth / 90),
                              MaterialButton(
                                onPressed: () {},
                                color: kTheamColor,
                                minWidth: 0,
                                height: kwidth / 30,
                                child: Text(
                                  "Add work Experiance",
                                  style: TextStyle(
                                      fontSize: kwidth / 90,
                                      color: Colors.white),
                                ),
                              ),
                              SizedBox(height: kwidth / 90),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ...List.generate(
                                    4,
                                    (index) => Padding(
                                      padding: EdgeInsets.all(1),
                                      child: GestureDetector(
                                        onTap: () {
                                          // setState(() {
                                          //   selector = index;
                                          //   print("$selector +a+ $count");
                                          // });
                                        },
                                        child: Container(
                                          width: kwidth / 140,
                                          height: kwidth / 150,
                                          decoration: BoxDecoration(
                                            color: selector == index
                                                ? Colors.grey
                                                : kTheamColor,
                                            borderRadius: BorderRadius.circular(
                                                kwidth / 90),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        child: Icon(Icons.keyboard_arrow_left,
                                            size: kwidth / 50,
                                            color: kTheamColor),
                                        onTap: () {
                                          // setState(() {
                                          //   if (selector == 0) {
                                          //     selector = 3;
                                          //   } else {
                                          //     selector--;
                                          //   }
                                          //   // selector = count;
                                          //   print("$selector +a+ $count");
                                          // });
                                        },
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          // setState(() {
                                          //   if (selector == 3) {
                                          //     selector = 0;
                                          //   } else {
                                          //     selector++;
                                          //   }
                                          //   // selector = count;
                                          //
                                          //   print("$selector +a+ $count");
                                          // });
                                        },
                                        child: Icon(Icons.keyboard_arrow_right,
                                            size: kwidth / 50,
                                            color: kTheamColor),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: kwidth / 40),
            Obx(
              () {
                if (_newsController.isLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Container(
                    height: kwidth * 25,
                    width: kwidth * 0.8,
                    color: Colors.white,
                    padding: EdgeInsets.all(kwidth / 220),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: _newsController.productList?.articles?.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: (Responsive.isDesktop(context)) ? 3 : 2,
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 4,
                        mainAxisExtent: kwidth / 3.5,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          elevation: 5,
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.all(kwidth / 90),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image(
                                    image: NetworkImage(
                                        "${_newsController.productList?.articles?[index].urlToImage}"),
                                    height: kwidth / 8,
                                    width: kwidth / 8,
                                  ),
                                ),
                                Text(
                                  "${_newsController.productList?.articles?[index].title}",
                                  maxLines: 2,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: kwidth / 80,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: kwidth / 200),
                                Text(
                                  "${_newsController.productList?.articles?[index].description}",
                                  maxLines: 4,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: kwidth / 90,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                SizedBox(height: kwidth / 200),
                                Text(
                                  "${_newsController.productList?.articles?[index].publishedAt}",
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: kwidth / 100,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
            SizedBox(height: kwidth / 40),
            SizedBox(height: kwidth / 40),
          ],
        ),
      ),
    );
  }
}
