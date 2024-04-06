import 'package:flutter/material.dart';
import 'package:steam_app_clone/ui/views/anasayfa.dart';
import 'package:steam_app_clone/ui/views/bildirimler.dart';
import 'package:steam_app_clone/ui/views/guard.dart';
import 'package:steam_app_clone/ui/views/haberler.dart';
import 'package:steam_app_clone/ui/views/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int seciliIndex = 0;
  List<Widget> sayfalar = [
    const AnaSayfa(),
    const Haberler(),
    const Guard(),
    const Bildirimler(),
    const Menu()
  ];

  @override
    Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: sayfalar[seciliIndex],
          bottomNavigationBar: BottomNavigationBar(
            iconSize: 28,
            currentIndex: seciliIndex,
            unselectedItemColor: Colors.white70,
            selectedItemColor: Colors.blue[600],
            backgroundColor: Colors.black87,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.sell_sharp), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shield_sharp), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.reorder_rounded), label: ""),
            ],
            onTap: (index) {
              setState(() {
                seciliIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
          ),
        ));
  }
}
