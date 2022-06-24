import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/ui/layoutapp.dart';

import '../componants/componant.dart';
import '../controller/cubit_project.dart';
import '../controller/cubit_state.dart';
import '../widgets/bottom_navigation_widget.dart';
import 'home_screen.dart';

class MyOrders extends StatelessWidget {
  Map<String, String>? authData;
  bool? isNewOrder;
  MyOrders({
    this.authData,
    this.isNewOrder,
  });
  // Random random = new Random();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitProject, Projectstate>(
      listener: (context, state) {},
      builder: ((context, state) {
        // int randomNumber = random.nextInt(1000) + 1000;

        return Scaffold(
          appBar: AppBar(
            title: Text("My Orders"),
          ),
          body: Column(
            children: [
              Container(
                child: Expanded(
                  child: ListView.separated(
                    itemCount: CubitProject.name.length,
                    itemBuilder: ((context, index) {
                      return CubitProject.name == null
                          ? Container()
                          : DefaultTextStyle(
                              style:
                                  TextStyle(fontSize: 23, color: Colors.black),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(20.0),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 3,
                                            offset: Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      width: double.infinity,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              "code: #${CubitProject.code[index].toString()}"),
                                          SizedBox(height: 10),
                                          Text(
                                              "total price : ${CubitProject.orderPrice[index]}"),
                                          SizedBox(height: 10),
                                          Text(
                                              "total point : ${CubitProject.orderPoint[index]}"),
                                          SizedBox(height: 10),
                                          Text(
                                              "name: ${CubitProject.name[index].toString()}"),
                                          SizedBox(height: 10),
                                          Text(
                                              "mobile phone : ${CubitProject.phone[index].toString()}"),
                                          SizedBox(height: 10),
                                          Text(
                                              "Address: ${CubitProject.address[index].toString()}"),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                    }),
                    separatorBuilder: (context, index) {
                      return Container();
                    },
                  ),
                ),
              ),
              isNewOrder == true
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: ElevatedButton(
                        // color: Colors.green,
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size.fromHeight(40),
                        ),
                        child: Text(
                          "Done",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          // CubitProject.get(context).myorderdata();
                          // CubitProject.totalpoint=0;
                          //  _authData["name"]="";
                          //    _authData["phone"]="";
                          //     _authData["address"]="";
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => LayoutApp()),
                              (Route<dynamic> route) => false);
                        },
                      ),
                    )
                  : Container(),
            ],
          ),

          // bottomNavigationBar: BottomNavigationWidget(),
        );
      }),
    );
  }
}
