import 'package:flutter/material.dart';
import 'package:listtalk/TaskOne.dart';

import 'TaskTwo.dart';

class BottomNavigationBarWithTabs extends StatefulWidget {
  @override
  _BottomNavigationBarWithTabsState createState() =>
      _BottomNavigationBarWithTabsState();
}

class _BottomNavigationBarWithTabsState
    extends State<BottomNavigationBarWithTabs> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    HomeTab(),       // Home screen
    CallScreenTab(), // Call screen
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            label: 'Task1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            label: 'Task2',
          ),
        ],
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListFirst();
  }
}

class CallScreenTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListSecond();
  }
}

void main() {
  runApp(MaterialApp(
    home: BottomNavigationBarWithTabs(),
  ));
}


