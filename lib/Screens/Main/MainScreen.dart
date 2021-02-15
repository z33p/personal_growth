import 'package:flutter/material.dart';
import 'package:personal_grouth/Screens/Main/ConfigureAppScreen.dart';
import 'package:personal_grouth/Screens/Main/CreateProductScreen.dart';
import 'package:personal_grouth/Screens/Main/ListProductsScreen.dart';

class MainScreen extends StatefulWidget {
  final String title;

  MainScreen({this.title});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  List<Widget> listScreens;

  @override
  void initState() {
    super.initState();
    listScreens = [
      ListProductsScreen(),
      CreateProductScreen(),
      ConfigureAppScreen()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (i) => setState(() => currentIndex = i),
        currentIndex: currentIndex,
        elevation: 12.0,
        items: [
          BottomNavigationBarItem(label: "Listar", icon: Icon(Icons.list)),
          BottomNavigationBarItem(
              label: "Criar", icon: Icon(Icons.create_sharp)),
          BottomNavigationBarItem(
              label: "Configurações", icon: Icon(Icons.settings)),
        ],
      ),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: listScreens[currentIndex],
      ),
    );
  }
}
