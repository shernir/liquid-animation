import 'package:flutter/material.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import './homeScreen.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int index = 0;
  final List<Map<String, Widget>> _pages = [
    {
      'page': HomeScreen(),
    },
    {
      'page': Container(
        width: double.infinity,
        child: Column(children: [Center(child: Text("Chat"))]),
      ),
    },
    {
      'page': Container(
        width: double.infinity,
        child: Column(children: [Center(child: Text("About"))]),
      ),
    },
    {
      'page': Container(
        width: double.infinity,
        child: Center(child: Text("New")),
      ),
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[index]['page'],
      backgroundColor: Color(0xFF75B7E1),
      bottomNavigationBar: FluidNavBar(
        icons: [
          FluidNavBarIcon(
              icon: Icons.home,
              backgroundColor: Color(0xFF4285F4),
              extras: {"label": "home"}),
          FluidNavBarIcon(
              icon: Icons.bookmark_border,
              backgroundColor: Color(0xFFEC4134),
              extras: {"label": "bookmark"}),
          FluidNavBarIcon(
              icon: Icons.apps,
              backgroundColor: Color(0xFFFCBA02),
              extras: {"label": "partner"}),
          FluidNavBarIcon(
              icon: Icons.person,
              backgroundColor: Color(0xFF34A950),
              extras: {"label": "conference"}),
        ],
        onChange: (page) => {
          setState(() {
            index = page;
          })
        },
        style: FluidNavBarStyle(iconUnselectedForegroundColor: Colors.white),
        scaleFactor: 1.5,
        defaultIndex: 0,
        itemBuilder: (icon, item) => Semantics(
          label: icon.extras!["label"],
          child: item,
        ),
      ),
    );
  }
}
