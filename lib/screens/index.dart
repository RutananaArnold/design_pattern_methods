import 'package:flutter/material.dart';

import 'factory_screen.dart';
import 'singleton_screen.dart';

class Index extends StatefulWidget {
  int currentIndex;
  Index({super.key, this.currentIndex = 0});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  List<Widget> tabs = [const FactoryMethodPage(), const Singleton()];

  void onItemTapped(int index) {
    setState(() {
      widget.currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Design Patterns"),
      ),
      body: tabs[widget.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.pattern),
                label: "Factory Method",
                backgroundColor: Colors.green),
            BottomNavigationBarItem(
                icon: Icon(Icons.security),
                label: "Singleton",
                backgroundColor: Colors.grey),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: widget.currentIndex,
          selectedItemColor: Colors.black,
          iconSize: 40,
          onTap: onItemTapped,
          elevation: 5),
    );
  }
}
