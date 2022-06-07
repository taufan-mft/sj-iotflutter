import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:imapunya/light_page.dart';
import 'package:imapunya/energy_page.dart';
import 'package:imapunya/history_page.dart';

class nav extends StatefulWidget {
  const nav({Key? key}) : super(key: key);

  @override
  State<nav> createState() => _navState();
}

class _navState extends State<nav> {
  int index = 0;
  final screens = [
    LightPage(),
    EnergyPage(),
    HistoryPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          backgroundColor: Colors.greenAccent[100],
          indicatorColor: Colors.white60,
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          ),
        ),
        child: NavigationBar(
          height: 60,
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.light_mode),
              label: 'Light',
            ),
            NavigationDestination(
              icon: Icon(Icons.energy_savings_leaf),
              label: 'Energy',
            ),
            NavigationDestination(
              icon: Icon(Icons.history_toggle_off),
              label: 'History',
            ),
          ],
        ),
      ),
    );
  }
}
