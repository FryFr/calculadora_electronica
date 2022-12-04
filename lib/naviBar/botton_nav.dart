import 'package:flutter/material.dart';

class bottomNavigator extends StatefulWidget {
  final Function currentIndex;
  const bottomNavigator({Key? key, required this.currentIndex}) : super(key: key);

  @override
  State<bottomNavigator> createState() => _bottomNavigatorState();
}

class _bottomNavigatorState extends State<bottomNavigator> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      onTap: (int i){
        setState(() {

        });
        index =i;
        widget.currentIndex(i);
      },
      type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.amber,
        iconSize: 25.0,
        selectedFontSize: 14.0,
        unselectedFontSize: 12.0,
        items: const [
      BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Inicio'
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Buscar'
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.store),
          label: 'Tienda'
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Ajustes'
      ),
    ]);
  }
}
