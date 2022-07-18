import 'package:blogresponsive/responsive/responsive.dart';
import 'package:blogresponsive/views/DesktopHomeScreen.dart';
import 'package:blogresponsive/views/updatenewspage/updatenewshomescreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DeskTop();
    //   Responsive(
    //   deskTop: DeskTop(),
    //   tablet: TabLate(),
    //   mobile: Mobile(),
    // );
  }
}

class DeskTop extends StatelessWidget {
  const DeskTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    print(MediaQuery.of(context).size.height);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: //
          // DeskHomeScreen(),
      UpdateNewsHomepage(),
    );
  }
}

class TabLate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'TabLate mode',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class Mobile extends StatelessWidget {
  const Mobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Mobile mode',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
