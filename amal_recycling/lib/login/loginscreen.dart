import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:graduation/componants/componant.dart';
import 'package:graduation/componants/constunt.dart';
import 'package:graduation/dio_helper/cashe_helper.dart';
import 'package:graduation/ui/profile.dart';
// import 'package:flutter_conditional_rendering/conditional.dart';
// import 'package:theshop/componants/componant.dart';
// import 'package:theshop/dio_helper/cashe_helper.dart';
// import '../layoutshop.dart';
import 'login cubit/lodin_status.dart';
import 'login cubit/lodingcubit.dart';

//    compileSdkVersion flutter.compileSdkVersion
//    ext.kotlin_version = '1.3.50'

class login_screen extends StatelessWidget {
  //const login_screen({ Key? key }) : super(key: key);
  var formkey = GlobalKey<FormState>();
  var email_controller = TextEditingController();
  var pass_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Cubitlogin(),
      child: BlocConsumer<Cubitlogin, loginstates>(
        listener: (context, state) {
          if (state is loginsuccess) {
            if (state.loginmodel.status) {
              print(state.loginmodel.data!.token);
              print(state.loginmodel.status);
              print(state.loginmodel.message);
              //token1=state.loginmodel.data!.token;
              CacheHelper.savedata(
                      key: "token", value: state.loginmodel.data!.token)
                  .then((value) => finash_navigate(context, Profile()));

              fluttertost(state.loginmodel.message, toststate.Success);
            } else {
              print(state.loginmodel.message);
              fluttertost(state.loginmodel.message, toststate.Error);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "LOGIN",
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Login now to browse hot offers",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: email_controller,
                          decoration: const InputDecoration(
                            labelText: "Email",
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          onFieldSubmitted: (val) {
                            print(val);
                          },
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "email must not empty";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: pass_controller,
                          decoration: InputDecoration(
                              labelText: "Password",
                              prefixIcon: Icon(Icons.lock_rounded),
                              border: OutlineInputBorder(),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    Cubitlogin.get(context).changepassicon();
                                  },
                                  icon:
                                      Icon(Cubitlogin.get(context).passicon))),
                          obscureText: Cubitlogin.get(context).ispass,
                          keyboardType: TextInputType.text,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "pass must not be empty";
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Container(
                            width: double.infinity,
                            child: Conditional.single(
                              context: context,
                              conditionBuilder: (BuildContext context) {
                                return state is! loginloding;
                              },
                              widgetBuilder: (context) {
                                return RaisedButton(
                                  color:deffultcolor,
                                  child: Text(
                                    "login",
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                  ),
                                  onPressed: () {
                                    if (formkey.currentState!.validate()) {
                                      Cubitlogin.get(context).userlogin(
                                        email: email_controller.text,
                                        pass: pass_controller.text,
                                        context: context,
                                      );
                                    }
                                  },
                                );
                              },
                              fallbackBuilder: (BuildContext context) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
