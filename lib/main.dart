import 'package:curved_navbar/pages/FavouritePage.dart';
import 'package:curved_navbar/pages/HomePage.dart';
import 'package:curved_navbar/pages/ProfilePage.dart';
import 'package:curved_navbar/pages/SearchPage.dart';
import 'package:curved_navbar/pages/SettingsPage.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color primary = Color.fromARGB(255, 4, 66, 209);
  Color secondary = Color.fromARGB(255, 4, 144, 209);

  var _index = 2;
  final navigationKey = GlobalKey<CurvedNavigationBarState>();

  final screens = [
    SearchPage(),
    FavouritePage(),
    HomePage(),
    SettingsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(
        Icons.search,
        size: 30,
      ),
      Icon(
        Icons.favorite,
        size: 30,
      ),
      Icon(
        Icons.home,
        size: 30,
      ),
      Icon(
        Icons.settings,
        size: 30,
      ),
      Icon(
        Icons.person,
        size: 30,
      ),
    ]; // <Widget>[]

    return Container(
      color: primary,
      child: SafeArea(
        top: false,
        child: Scaffold(
            backgroundColor: secondary,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              // Here we take the value from the MyHomePage object that was created by
              // the App.build method, and use it to set our appbar title.
              title: Text('Curved Nav Bar'),
              centerTitle: true,
              elevation: 0.0,
            ),
            body: screens[_index], // Center
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                iconTheme: IconThemeData(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              child: CurvedNavigationBar(
                key: navigationKey,
                onTap: (value) => setState(() {
                  this._index = value;
                }),
                items: items,
                animationCurve: Curves.easeInOut,
                animationDuration: Duration(milliseconds: 300),
                index: _index,
                color: primary,
                buttonBackgroundColor: primary,
                backgroundColor: Colors.transparent,
                // This trailing comma makes auto-formatting nicer for build methods.
              ),
            )),
      ),
    );
  }
}
