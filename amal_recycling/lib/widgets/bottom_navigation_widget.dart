import 'package:flutter/material.dart';
import 'package:graduation/controller/cubit_project.dart';

class BottomNavigationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: CubitProject.indexBottomNavigator,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        CubitProject.indexBottomNavigator = index;
      },
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.event_note_outlined), label: "Activity"),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_box_rounded), label: "Profile"),
      ],
    );
  }
}
