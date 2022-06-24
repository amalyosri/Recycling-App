import 'package:flutter/material.dart';
import 'package:graduation/controller/cubit_project.dart';

import '../widgets/bottom_navigation_widget.dart';

class LayoutApp extends StatelessWidget {
  const LayoutApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: CubitProject.screensbottomnavigator[CubitProject.indexBottomNavigator],
      bottomNavigationBar: BottomNavigationWidget(),
    );
  }
}