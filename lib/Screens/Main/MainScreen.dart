import 'package:flutter/material.dart';
import 'package:personal_grouth/Screens/Main/ConfigureAppScreen.dart';
import 'package:personal_grouth/Screens/Main/CreateProductScreen.dart';
import 'package:personal_grouth/Screens/Main/ListProductsScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainScreen extends StatefulWidget {
  final String title;

  MainScreen({this.title});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 1;
  List<Widget> listScreens;

  @override
  void initState() {
    super.initState();
    listScreens = [
      CreateProductScreen(),
      ListProductsScreen(),
      ConfigureAppScreen()
    ];
  }

  @override
  Widget build(BuildContext context) {
    final langLabels = AppLocalizations.of(context);

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (i) => setState(() => currentIndex = i),
        currentIndex: currentIndex,
        elevation: 12.0,
        items: [
          BottomNavigationBarItem(
              label: langLabels.add, icon: Icon(Icons.post_add_rounded)),
          BottomNavigationBarItem(
              label: langLabels.cart, icon: Icon(Icons.add_shopping_cart)),
          BottomNavigationBarItem(
              label: langLabels.settings, icon: Icon(Icons.settings)),
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
