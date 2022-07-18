import 'package:blogresponsive/constant/constants.dart';
import 'package:blogresponsive/responsive/responsive.dart';
import 'package:blogresponsive/views/components/BoxContainer.dart';
import 'package:blogresponsive/views/updatenewspage/postNewsPage.dart';
import 'package:blogresponsive/views/updatenewspage/resources_page.dart';
import 'package:flutter/material.dart';

class UpdateNewsHomepage extends StatefulWidget {
  const UpdateNewsHomepage({Key? key}) : super(key: key);

  @override
  State<UpdateNewsHomepage> createState() => _UpdateNewsHomepageState();
}

class _UpdateNewsHomepageState extends State<UpdateNewsHomepage>
    with TickerProviderStateMixin {
  TabController? tabcontroller, tabcontroller2, tabController;

  List mtab = ["News", "Jobs", "Membership Greds", "Recruitments"];
  List mtab2 = ["AHL", "33%", "MHL"];
  List tabs = [
    "Resources",
    "travel",
    "Developments",
    "International",
    "Investments"
  ];

  @override
  void initState() {
    // TODO: implement initState
    tabcontroller = TabController(length: mtab.length, vsync: this);
    tabcontroller2 = TabController(length: mtab2.length, vsync: this);
    tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  int select = 0;
  int select2 = 0;
  int select3 = 0;

  @override
  // TODO: implement context
  BuildContext get context => super.context;

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    print(MediaQuery.of(context).size.height);
    final kwidth = MediaQuery.of(context).size.width;
    final kheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kwidth / 25),
        child: Container(
          color: kAppbarColor,
          child: Row(
            children: [
              SizedBox(width: kwidth / 25),
              Image.asset(
                'assets/png/Logoo.png',
                height: kwidth / 26,
              ),
              Text(
                "Holedo",
                style: TextStyle(
                  fontSize: kwidth / 70,
                  color: kPrimaryColor,
                ),
              ),
              SizedBox(width: kwidth * 0.01),
              Container(
                width: kwidth * 0.55,
                height: kwidth / 25,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: TabBar(
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: kTheamColor,
                  padding: EdgeInsets.symmetric(horizontal: kwidth / 80),
                  labelColor: Colors.white,
                  controller: tabcontroller,
                  tabs: List.generate(
                    mtab.length,
                    (index) => Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: kwidth / 90, vertical: kwidth / 80),
                      child: Text(
                        '${mtab[index]}',
                        style: TextStyle(
                            fontSize: kwidth / 90, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: kwidth * 0.01),
              MaterialButton(
                onPressed: () {},
                color: Colors.black,
                height: kwidth / 25,
                minWidth: 0,
                child: Row(
                  children: [
                    Icon(
                      Icons.lock,
                      color: Colors.white,
                      size: kwidth / 74.81,
                    ),
                    Text(
                      "Log in",
                      style:
                          TextStyle(fontSize: kwidth / 90, color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(width: kwidth * 0.01),
              MaterialButton(
                onPressed: () {},
                color: kTheamColor,
                minWidth: 0,
                height: kwidth / 25,
                child: Row(
                  children: [
                    Icon(
                      Icons.lock,
                      color: Colors.white,
                      size: kwidth / 74.81,
                    ),
                    Text(
                      "Sign up free",
                      style:
                          TextStyle(fontSize: kwidth / 90, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: kwidth,
              height: kwidth / 15,
              color: kAppbarColor,
              padding: EdgeInsets.symmetric(horizontal: kwidth / 4),
              child: Container(
                width: kwidth / 2,
                height: kwidth / 25,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: TabBar(
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: kTheamColor,
                  padding: EdgeInsets.symmetric(horizontal: kwidth / 80),
                  labelColor: Colors.white,
                  controller: tabcontroller2,
                  tabs: List.generate(
                    mtab2.length,
                    (index) => Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: kwidth / 90, vertical: kwidth / 80),
                      child: Text(
                        '${mtab2[index]}',
                        style: TextStyle(
                            fontSize: kwidth / 90, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: kwidth,
              height: kwidth / 25,
              padding: EdgeInsets.symmetric(horizontal: kwidth / 5),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: TabBar(
                unselectedLabelColor: Colors.grey,
                indicatorColor: kTheamColor,
                labelColor: kTheamColor,
                controller: tabController,
                tabs: List.generate(
                  tabs.length,
                  (index) => Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: kwidth / 130, vertical: kwidth / 80),
                    child: Text(
                      '${tabs[index]}',
                      style: TextStyle(
                          fontSize: kwidth / 90, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: kwidth * 2.38,
              child: TabBarView(
                controller: tabController,
                children: [
                  ResourcesPage(),
                  // Text('def'),
                  Text(
                    'def',
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                  Text(
                    'def',
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                  Text(
                    'ghi',
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                  // Text('jkl'),
                  PostNewsPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
