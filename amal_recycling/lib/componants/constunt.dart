
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../controller/cubit_project.dart';

String ?token1;
var deffultcolor= Colors.green;
void printfulltext(String text){
  final pattern= RegExp('.{1.800}');
  pattern.allMatches(text).forEach((match)=>print(match.group(0)));
}



//  TextButton(child:Text("logout") ,
//      onPressed: (){
//       CacheHelper.removedata("token").then((value) =>
//     if(value==true){ finash_navigate(context, login_screen()));}
    
//      },)