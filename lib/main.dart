import 'package:flutter/material.dart';
import 'package:hola_mundo_flutter/naviBar/botton_nav.dart';
import 'package:hola_mundo_flutter/screen/routes.dart';
import 'package:flutter/services.dart';
import 'package:hola_mundo_flutter/theme/themeChange.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeChanger(ThemeData.dark()),
      child: MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.getTheme(),
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