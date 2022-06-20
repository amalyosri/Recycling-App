import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/controller/cubit_project.dart';
import 'package:graduation/dio_helper/cashe_helper.dart';
import 'package:graduation/dio_helper/dio_helper.dart';
import 'package:graduation/on%20Boarding/on_Boarding_screen.dart';

import 'ui/home_screen.dart';
import 'ui/editprofile.dart';
import 'ui/profile.dart';
import 'ui/signup_signin.dart';
import 'controller/cubit_state.dart';
import 'ui/task_screen.dart';

void main() async {
  DioHelper.init();
  await CacheHelper();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CubitProject(),
      child: BlocConsumer<CubitProject, Projectstate>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.green,
              primaryColor: Colors.green,
            ),
            home: OnBoardingScreen(),
          );
        },
      ),
    );
  }
}

/*MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Colors.green,
      ),
      home:  BlocProvider(create: (context)=>CubitProject(),
    child:  BlocConsumer<CubitProject,projectstate>( 
      listener:(BuildContext context,state){ } ,
    
    builder:(BuildContext context,state){
    return Profile();
    }),
    ),

    ) */
