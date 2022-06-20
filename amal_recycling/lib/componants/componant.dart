import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void finash_navigate(context,widgit){
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: ( context) =>widgit),
  (route)=>false

   );
}

void fluttertost(msg,toststate state){
  Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: changecolortost(state),
        textColor: Colors.white,
        fontSize: 16.0
    );
}

enum toststate{
  Error,
  Success,
  Warning,
}

Color changecolortost(toststate state){
 var color;

switch (state){
case toststate.Error:
color= Colors.red;
break;

case toststate.Success:
color= Colors.green;
break;

case toststate.Warning: 
color= Colors.yellow;
break;

}

return color;
}