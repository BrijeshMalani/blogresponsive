import 'package:blogresponsive/constant/constants.dart';
import 'package:blogresponsive/models/Blog1.dart';
import 'package:blogresponsive/responsive/responsive.dart';
import 'package:blogresponsive/views/header/web_menu.dart';
import 'package:blogresponsive/views/updatenewspage/updatenewshomescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/get_utils.dart';

import '../models/Blog.dart';

class DeskHomeScreen extends StatefulWidget {
  const DeskHomeScreen({Key? key}) : super(key: key);

  @override
  State<DeskHomeScreen> createState() => _DeskHomeScreenState();
}

class _DeskHomeScreenState extends State<DeskHomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  List tabs = [
    "Resources",
    "travel",
    "Developments",
    "International",
    "Investments"
  ];

  int select = 0;
  bool close = false;

  @override
  initState() {
    tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

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
              if (Responsive.isDesktop(context)) SizedBox(width: kwidth / 15),
              Image.asset(
                'assets/png/Logoo.png',
                height: kwidth / 26,
              ),
              Container(
                height: kwidth / 17.45,
                width: kwidth / 4.378,
                decoration: BoxDecoration(
                  color: Color(0xff2B375E),
                ),
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: kwidth * 0.01),
                      hintStyle:
                          TextStyle(color: Colors.white, fontSize: kwidth / 80),
                      prefixIcon: Icon(
                        Icons.search,
                        size: kwidth * 0.02,
                        color: Colors.white,
                      ),
                      hintText: 'Search',
                      focusedBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
              ),
              if (!Responsive.isMobile(context)) WebMenu(),
              Spacer(),
              if (Responsive.isDesktop(context))
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(kwidth * 0.012),
                      child: SvgPicture.asset(
                        "assets/svg/Vector.svg",
                        height: kwidth / 50,
                        width: kwidth / 50,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(kwidth * 0.012),
                      child: SvgPicture.asset(
                        "assets/svg/Vector (1).svg",
                        height: kwidth / 50,
                        width: kwidth / 50,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(kwidth * 0.012),
                      child: SvgPicture.asset(
                        "assets/svg/Vector (2).svg",
                        height: kwidth / 50,
                        width: kwidth / 50,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(kwidth * 0.012),
                      child: Image.asset("assets/png/Avatar.png"),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          if (close == false)
            Container(
              width: kwidth,
              height: kwidth / 25,
              color: kTheamshadeColor,
              child: Padding(
                padding: EdgeInsets.all(kwidth * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    Text(
                      "New to Hospitality Leaders? Sign up now to join our membership",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(color: kTheamColor, fontSize: kwidth / 80),
                    ),
                    SizedBox(width: kwidth / 60),
                    MaterialButton(
                      onPressed: () {},
                      height: kwidth * 0.035,
                      color: kTheamColor,
                      child: Text(
                        "Join now. It's free",
                        style:
                            TextStyle(color: kBgColor, fontSize: kwidth / 80),
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          close = true;
                        });
                      },
                      icon: Icon(Icons.close, size: kwidth / 60),
                      color: kTheamColor,
                    ),
                  ],
                ),
              ),
            ),
          Container(
            width: kwidth,
            height: kwidth / 2.6,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/png/coverImage.png",
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: kwidth / 30, vertical: kwidth / 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Resources".toUpperCase(),
                    style: TextStyle(
                      fontSize: kwidth / 80,
                      color: kBgColor,
                    ),
                  ),
                  Text(
                    "5 Steps for Travel Brands to Build a Brand Ambassador Program",
                    style: TextStyle(
                      fontSize: kwidth / 60,
                      color: kBgColor,
                    ),
                  ),
                  Text(
                    "By: Pam Carrol   •   26 August 2015   •   10:40",
                    style: TextStyle(
                      fontSize: kwidth / 80,
                      color: kBgColor,
                    ),
                  )
                ],
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Column(
                            children: List.generate(
                              blogPosts.length,
                              (index) => Padding(
                                padding: const EdgeInsets.only(
                                  bottom: kDefaultPadding,
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(kwidth * 0.01),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AspectRatio(
                                            aspectRatio: 2.2,
                                            child: Image.asset(
                                                blogPosts[index].image),
                                          ),
                                          SizedBox(
                                            height: kDefaultPadding,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Resource".toUpperCase(),
                                                style: TextStyle(
                                                  color: kDarkBlackColor,
                                                  fontSize: kwidth / 80,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                              vertical: kwidth / 128,
                                            ),
                                            child: Text(
                                              blogPosts[index].title,
                                              style: TextStyle(
                                                fontSize: kwidth / 50,
                                                fontFamily: "Raleway",
                                                color: kDarkBlackColor,
                                                height: 1.3,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: kwidth / 128),
                                          Text(blogPosts[index].date,
                                              style: TextStyle(
                                                fontSize: kwidth / 80,
                                              )),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GridView.builder(
                              itemCount: blogPosts1.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: kDefaultPadding / 2,
                                      crossAxisSpacing: kDefaultPadding / 2,
                                      mainAxisExtent: kwidth / 3.7),
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  height: kwidth / 2.7,
                                  decoration:
                                      BoxDecoration(color: Colors.white),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: kwidth / 50,
                                        vertical: kwidth / 50),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(blogPosts1[index].image),
                                        SizedBox(height: kwidth * 0.01),
                                        Text(
                                          "Resources".toUpperCase(),
                                          style: TextStyle(
                                            fontSize: kwidth / 110,
                                            color: kDarkBlackColor,
                                          ),
                                        ),
                                        SizedBox(height: kwidth / 128),
                                        Text(
                                          blogPosts1[index].title,
                                          style: TextStyle(
                                            fontSize: kwidth / 80,
                                            fontWeight: FontWeight.bold,
                                            color: kDarkBlackColor,
                                          ),
                                        ),
                                        SizedBox(height: kwidth / 128),
                                        Text(
                                          blogPosts1[index].date,
                                          style: TextStyle(
                                            fontSize: kwidth / 90,
                                            color: kBodyTextColor,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: kwidth * 0.01),
                          MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UpdateNewsHomepage(),
                                ),
                              );
                            },
                            color: kTheamColor,
                            height: kwidth / 25,
                            child: Padding(
                              padding: EdgeInsets.all(kwidth * 0.01),
                              child: Text(
                                "LOAD MORE",
                                style: TextStyle(
                                    color: kBgColor, fontSize: kwidth / 100),
                              ),
                            ),
                          ),
                          SizedBox(height: kwidth * 0.01),
                        ],
                      ),
                    ),
                    SizedBox(width: kwidth * 0.01),
                    Expanded(
                      child: Column(
                        children: [
                          // Search(),
                          // SizedBox(height: kDefaultPadding),
                          // Categoryies(),
                          // SizedBox(height: kDefaultPadding),
                          // RecentPost(),
                        ],
                      ),
                    ),
                  ],
                ),
                Text('def'),
                Text('ghi'),
                Text('jkl'),
                Text('mno'),
              ],
            ),
          ),
          Container(
            width: kwidth,
            height: kwidth / 1.35,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/png/footer.png"),
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: kwidth * 0.06),
                Text(
                  "connect with hospitality leaders online".toUpperCase(),
                  style: TextStyle(
                    fontSize: kwidth / 100,
                    color: Colors.white,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: kwidth * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: kwidth / 7,
                      height: kwidth / 40,
                      decoration: BoxDecoration(
                        color: Color(0xFF5E72F1),
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/svg/facebook.svg",
                            height: kwidth / 70,
                          ),
                          SizedBox(width: kwidth * 0.01),
                          Text(
                            "Facebook",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: kwidth / 100,
                            ),
                          ),
                          SizedBox(width: kwidth * 0.01),
                          Text(
                            "14.6 k",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: kwidth / 100,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: kwidth * 0.01),
                    Container(
                      width: kwidth / 7,
                      height: kwidth / 40,
                      decoration: BoxDecoration(
                        color: Color(0xFF3DCEEF),
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/svg/twitter.svg",
                            height: kwidth / 70,
                          ),
                          SizedBox(width: kwidth * 0.01),
                          Text(
                            "Tweeter",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: kwidth / 100,
                            ),
                          ),
                          SizedBox(width: kwidth * 0.01),
                          Text(
                            "14.6 k",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: kwidth / 100,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: kwidth * 0.01),
                    Container(
                      width: kwidth / 7,
                      height: kwidth / 40,
                      decoration: BoxDecoration(
                        color: Color(0xFFEF3D3D),
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/svg/google.svg",
                            height: kwidth / 70,
                          ),
                          SizedBox(width: kwidth * 0.01),
                          Text(
                            "Google +",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: kwidth / 100,
                            ),
                          ),
                          SizedBox(width: kwidth * 0.01),
                          Text(
                            "14.6 k",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: kwidth / 100,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: kwidth * 0.01),
                    Container(
                      width: kwidth / 7,
                      height: kwidth / 40,
                      decoration: BoxDecoration(
                        color: Color(0xFF1C90AB),
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/svg/linkdln.svg",
                            height: kwidth / 70,
                          ),
                          SizedBox(width: kwidth * 0.01),
                          Text(
                            "Linkdln",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: kwidth / 100,
                            ),
                          ),
                          SizedBox(width: kwidth * 0.01),
                          Text(
                            "14.6 k",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: kwidth / 100,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: kwidth * 0.01),
                    Container(
                      width: kwidth / 7,
                      height: kwidth / 40,
                      decoration: BoxDecoration(
                        color: Color(0xFF0F6558),
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/svg/xing.svg",
                            height: kwidth / 70,
                          ),
                          SizedBox(width: kwidth * 0.01),
                          Text(
                            "Xing",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: kwidth / 100,
                            ),
                          ),
                          SizedBox(width: kwidth * 0.01),
                          Text(
                            "14.6 k",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: kwidth / 100,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: kwidth * 0.01),
                  ],
                ),
                SizedBox(height: kwidth * 0.08),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: kwidth / 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: kwidth * 0.005),
                          child: Text(
                            "Hospitality.pro",
                            style: TextStyle(
                              fontSize: kwidth / 100,
                              color: Colors.white,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: kwidth * 0.005),
                          child: Text(
                            "Home",
                            style: TextStyle(
                              fontSize: kwidth / 100,
                              color: kPrimaryColor,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: kwidth * 0.005),
                          child: Text(
                            "Membership grades",
                            style: TextStyle(
                              fontSize: kwidth / 100,
                              color: kPrimaryColor,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: kwidth * 0.005),
                          child: Text(
                            "Help",
                            style: TextStyle(
                              fontSize: kwidth / 100,
                              color: kPrimaryColor,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: kwidth * 0.005),
                          child: Text(
                            "Log in",
                            style: TextStyle(
                              fontSize: kwidth / 100,
                              color: kPrimaryColor,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: kwidth * 0.005),
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                              fontSize: kwidth / 100,
                              color: kPrimaryColor,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: kwidth / 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: kwidth * 0.005),
                          child: Text(
                            "Industry news",
                            style: TextStyle(
                              fontSize: kwidth / 100,
                              color: Colors.white,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: kwidth * 0.005),
                          child: Text(
                            "Latest news",
                            style: TextStyle(
                              fontSize: kwidth / 100,
                              color: kPrimaryColor,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: kwidth * 0.005),
                          child: Text(
                            "Become a publisher",
                            style: TextStyle(
                              fontSize: kwidth / 100,
                              color: kPrimaryColor,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: kwidth / 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: kwidth * 0.005),
                          child: Text(
                            "job",
                            style: TextStyle(
                              fontSize: kwidth / 100,
                              color: Colors.white,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: kwidth * 0.005),
                          child: Text(
                            "Finf a job",
                            style: TextStyle(
                              fontSize: kwidth / 100,
                              color: kPrimaryColor,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: kwidth * 0.005),
                          child: Text(
                            "List a job vacancy",
                            style: TextStyle(
                              fontSize: kwidth / 100,
                              color: kPrimaryColor,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: kwidth / 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: kwidth * 0.005),
                          child: Text(
                            "Recruiters",
                            style: TextStyle(
                              fontSize: kwidth / 100,
                              color: Colors.white,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: kwidth * 0.005),
                          child: Text(
                            "Recrietment solution",
                            style: TextStyle(
                              fontSize: kwidth / 100,
                              color: kPrimaryColor,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: kwidth * 0.005),
                          child: Text(
                            "partnership",
                            style: TextStyle(
                              fontSize: kwidth / 100,
                              color: kPrimaryColor,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: kwidth * 0.08),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: kwidth / 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: kwidth * 0.005),
                          child: Text(
                            "Hospitality Leaders ltd",
                            style: TextStyle(
                              fontSize: kwidth / 100,
                              color: kPrimaryColor,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: kwidth * 0.005),
                          child: Text(
                            "All Rights Reserveds",
                            style: TextStyle(
                              fontSize: kwidth / 100,
                              color: kPrimaryColor,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: kwidth * 0.005),
                          child: Text(
                            "Terms of Service",
                            style: TextStyle(
                              fontSize: kwidth / 100,
                              color: kPrimaryColor,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          // Image.asset("assets/png/footer.png"),
        ],
      ),
    );
  }
}
