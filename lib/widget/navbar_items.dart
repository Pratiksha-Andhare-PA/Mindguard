import 'package:flutter/material.dart';

class BottomNavigationItems {
  static const List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.assessment),
      label: 'Assessment',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.chat),
      label: 'Chat',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.folder),
      label: 'Resources',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.call),
      label: 'Helpline',
    ),
  ];
}
