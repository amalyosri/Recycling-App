import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/controller/cubit_project.dart';
import 'package:graduation/dio_helper/cashe_helper.dart';
import 'package:graduation/dio_helper/dio_helper.dart';
import 'package:graduation/on%20Boarding/on_Boarding_screen.dart';

import 'componants/constunt.dart';
import 'controller/bloc_observer.dart';
import 'login/loginscreen.dart';
import 'ui/home_screen.dart';
import 'ui/editprofile.dart';
import 'ui/layoutapp.dart';
import 'ui/profile.dart';
import 'ui/signup_signin.dart';
import 'controller/cubit_state.dart';

void main() async {
  BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      DioHelper.init();
      await CacheHelper.init();

      Widget widget1;
      bool? onboarding = CacheHelper.getDate(key: "onboarding");
      token1 = CacheHelper.getDate(key: "token");

      if (onboarding != null) {
        if (token1 != null) {
          widget1 = HomeScreen();
        } else {
          widget1 = login_screen();
        }
      } else {
        widget1 = OnBoardingScreen();
      }
      runApp(MyApp(widget1));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget? widget1;
  MyApp(this.widget1);

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
              home: OnBoardingScreen() //LayoutApp( ),
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
