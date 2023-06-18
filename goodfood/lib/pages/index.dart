import 'package:flutter/material.dart';
import 'package:goodfood/config/const.dart';
import 'package:goodfood/pages/favorites/favorite_body.dart';
import 'package:goodfood/pages/home/home_body.dart';
import 'package:goodfood/pages/seen/seen_body.dart';
import 'package:goodfood/providers/product_provider.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  static const routeName = "/";
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  int _selectedIndex = 0;

  late Future _dataFuture;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _dataFuture = Provider.of<ProductProvider>(context).readJson();
  }

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeBody(),
    const FavoriteBody(),
    const SeenBody()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _dataFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: dColorMain,
              title: const Center(
                child: Text('Good Food'),
              ),
            ),
            body: _widgetOptions[_selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Favorite',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.timelapse_sharp),
                  label: 'Seen',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: dColorIconButtonActive,
              onTap: _onItemTapped,
              backgroundColor: dColorMain,
              iconSize: sizeIconButton,
              unselectedItemColor: dColorIconButtonInActive,
            ),
          );
        });
  }
}
