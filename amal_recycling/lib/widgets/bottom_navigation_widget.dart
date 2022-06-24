import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/controller/cubit_project.dart';

import '../controller/cubit_state.dart';

class BottomNavigationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitProject,Projectstate>(
 listener:(context,state){},

      builder: ((context, state) {


      return BottomNavigationBar(
      currentIndex: CubitProject.indexBottomNavigator,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        CubitProject.get(context) .bottomNavigator(index);
      },
      items: const [
        
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.event_note_outlined), label: "my orders"),
      
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart), label: "cart"),
      ],
    );
    }));
  }
}
