import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class MenuController extends GetxController {
  RxInt _selectedIndex = 0.obs;
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  int get selectedIndex => _selectedIndex.value;

  List<String> get menuItems =>
      ["Home", "Profile", "News", "Jobs", "Recruitment", "Help"];

  GlobalKey<ScaffoldState> get scaffoldkey => _scaffoldkey;

  void openOrCloseDrawer() {
    // if (_scaffoldkey.currentState.isDrawerOpen) {
    //   _scaffoldkey.currentState.openEndDrawer();
    // } else {
    //   _scaffoldkey.currentState.openDrawer();
    // }
  }

  void setMenuIndex(int index) {
    _selectedIndex.value = index;
  }
}
