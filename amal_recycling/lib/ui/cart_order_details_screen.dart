import 'dart:math';

import 'package:flutter/material.dart';
import 'package:graduation/ui/layoutapp.dart';
import 'package:graduation/ui/myorders.dart';

import '../componants/componant.dart';
import '../controller/cubit_project.dart';
import 'home_screen.dart';
import 'infoform.dart';

class wastebasket extends StatelessWidget {
  bool? isNewOrder;

  wastebasket({
    this.isNewOrder,
  });

  Map<String, String> _authData = {
    "name": CubitProject.nameController.text,
    "phone": CubitProject.phoneController.text,
    "address": CubitProject.addressController.text,
  };

  Random random = new Random();

  @override
  Widget build(BuildContext context) {
    int randomNumber = random.nextInt(1000) + 1000;

    // MyOrders(
    //   authData: _authData,
    // );
    return Scaffold(
      appBar: AppBar(
        title: Text("order details"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: DefaultTextStyle(
          style: TextStyle(fontSize: 23, color: Colors.black),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("name: ${_authData["name"].toString()}"),
                        SizedBox(height: 10),
                        Text("mobile phone : ${_authData["phone"].toString()}"),
                        SizedBox(height: 10),
                        Text("Address: ${_authData["address"].toString()}"),
                        SizedBox(height: 10),
                        Text(
                            "total price : ${CubitProject.totalprice.toStringAsFixed(2)}"),
                        SizedBox(height: 10),
                        Text(
                            "total point : ${CubitProject.totalpoint.toStringAsFixed(2)}"),
                      ],
                    )),
                SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  width: double.infinity,

                  // height: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "plastic : ${CubitProject.totalPointsOfPlastic.toStringAsFixed(2)}"),
                      SizedBox(height: 10),
                      Text(
                          "paper : ${CubitProject.totalPointsOfPaper.toStringAsFixed(2)}"),
                      SizedBox(height: 10),
                      Text(
                          "cooking oil : ${CubitProject.totalPointsOfCooking.toStringAsFixed(2)}"),
                      SizedBox(height: 10),
                      Text(
                          "electronic : ${CubitProject.totalPointsOfElectronics.toStringAsFixed(2)}"),
                      SizedBox(height: 10),
                      Text(
                          "metals : ${CubitProject.totalPointsOfMetals.toStringAsFixed(2)}"),
                      SizedBox(height: 10),
                      Text(
                          "metals : ${CubitProject.totalPointsOfHome.toStringAsFixed(2)}"),
                      SizedBox(height: 10),
                      Text(
                          "home apoances : ${CubitProject.totalPointsOfSpareparts.toStringAsFixed(2)}"),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                isNewOrder == true
                    ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size.fromHeight(40),
                        ),
                        child: Text(
                          "Done",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          CubitProject.get(context).myorderdata(
                            randomNumber,
                            CubitProject.totalprice.toStringAsFixed(2),
                            CubitProject.totalpoint.toStringAsFixed(2),
                          );
                          // CubitProject.totalpoint=0;
                          //  _authData["name"]="";
                          //    _authData["phone"]="";
                          //     _authData["address"]="";
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) =>
                                    MyOrders(isNewOrder: true),
                              ),
                              (Route<dynamic> route) => false);
                        },
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
