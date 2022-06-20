// import '../../../model/logins.dart';

import 'package:graduation/model/logins.dart';

abstract class loginstates {}

class logininitial extends loginstates {}

class loginsuccess extends loginstates {
  final Loginmodel loginmodel;

  loginsuccess(this.loginmodel);
}

class loginloding extends loginstates {}

class loginError extends loginstates {
  String error;
  loginError(this.error);
}

class changepassiconstate extends loginstates {}
