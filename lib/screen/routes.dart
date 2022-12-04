import 'package:flutter/material.dart';
import 'package:hola_mundo_flutter/screen/homePage.dart';
import 'package:hola_mundo_flutter/screen/searchPage.dart';
import 'package:hola_mundo_flutter/screen/settingPage.dart';
import 'package:hola_mundo_flutter/screen/updatesPage.dart';

class Routes extends StatelessWidget {
  final int index;
  const Routes({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> myList = [
      const homePage(),
      const searchPage(),
      const updatePage(),
      const settingPage()
    ];
    return myList[index];
  }
}
