import 'package:flutter/material.dart';
import 'package:hola_mundo_flutter/naviBar/botton_nav.dart';
import 'package:hola_mundo_flutter/screen/routes.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget{
  const HomePage ({Key? key}) : super (key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  bottomNavigator ?myBottonNavigator;
  @override
  void initState() {
    myBottonNavigator = bottomNavigator(currentIndex: (i){
        setState(() {
          index = i;
        });
    });
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      bottomNavigationBar: myBottonNavigator,
      body: Routes(index: index)
    );
  }
}