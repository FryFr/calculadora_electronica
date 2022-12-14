import 'package:flutter/material.dart';
import 'package:hola_mundo_flutter/theme/themeChange.dart';
import 'package:provider/provider.dart';

class settingPage extends StatefulWidget {
  const settingPage({Key? key}) : super(key: key);
  @override
  State<settingPage> createState() => settings();
}

class settings extends State<settingPage> {
  bool switchCurrenValue = false;

 //theme.setTheme(ThemeData.dark());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            _textsHeader(),
            _darkModeBottom(),
            _lenguage(),
          ],
        ),
      ),
    );
  }

  Widget _textsHeader() {
    return Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 40,
            horizontal: 45
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text('Ajustes', style: TextStyle(
                fontSize: 30,
            )
            ),
          ],
        )

    );
  }
  Widget _darkModeBottom(){

    final theme = Provider.of<ThemeChanger>(context);
    return Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(Icons.dark_mode),
            Text('Cambiar a modo oscuro'),
            Switch.adaptive(
              value: switchCurrenValue,
              onChanged: (bool valueIn){
                if (switchCurrenValue == true){
                  theme.setTheme(ThemeData.light());
                }else{
                  theme.setTheme(ThemeData.dark());
                }
                setState(() {
                  switchCurrenValue = valueIn;
                });
              },
            ),
          ],
        )
      );
  }

  Widget _lenguage(){
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.flag,
          size: 30,
          color: Colors.amber
          ),
          title: const Text('Idioma'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: (){
            _mySheet(context);
          },
        )
      ],
    );
  }

  _mySheet(BuildContext context){
    List myList = ['Espa??ol',
      'English'
    ];

    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(32)
        )
      ),
      context: context,
      builder: (context){
      return SizedBox(
        height: 150.0,
          child: ListView.builder(
            itemCount: myList.length,
              itemBuilder: (_,i) => ListTile(
                title: Text(myList[i].toString()),
              )),
      );
    });
  }

}
