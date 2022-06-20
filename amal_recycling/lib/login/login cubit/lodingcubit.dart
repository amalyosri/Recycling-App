import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/componants/componant.dart';
import 'package:graduation/componants/endpoint.dart';
import 'package:graduation/dio_helper/dio_helper.dart';
import 'package:graduation/login/loginscreen.dart';
import 'package:graduation/model/logins.dart';
import 'package:graduation/ui/home_screen.dart';

// import 'package:theshop/dio_helper/dio_helper.dart';

// import '../../../componants/endpoint.dart';

// import '../../../model/logins.dart';

import 'lodin_status.dart';

class Cubitlogin extends Cubit<loginstates> {
  Cubitlogin() : super(logininitial());

  static Cubitlogin get(context) => BlocProvider.of(context);
  IconData passicon = Icons.visibility_outlined;
  bool ispass = true;

  void changepassicon() {
    ispass = !ispass;
    passicon =
        ispass ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(changepassiconstate());
  }

  late Loginmodel loginModel;

  void userlogin({required String email, required String pass, context}) {
    emit(loginloding());
    DioHelper.postData(url: Login, data: {
      "email": email,
      "password": pass,
    }).then((value) {
      loginModel = Loginmodel.fromjson(value.data);
      finash_navigate(context, HomeScreen());

      // print(loginmodel.data?.token);
      // print(loginmodel.status);
      // print(loginmodel.message);

      // emit(loginsuccess(loginModel));
    }).catchError((onError) {
      print(onError.toString());
      emit(loginError(onError));
    });
  }
}
