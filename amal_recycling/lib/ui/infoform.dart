import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/controller/cubit_project.dart';

import '../controller/cubit_state.dart';
import 'cart_order_details_screen.dart';

class InfoForm extends StatelessWidget {
  InfoForm({Key? key}) : super(key: key);
  final GlobalKey<FormState> _infoKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitProject, Projectstate>(
      listener: (context, state) {},
      builder: ((context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Info form"),
          ),
          body: SingleChildScrollView(
            child: Form(
              key: _infoKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: CubitProject.nameController,
                      decoration: const InputDecoration(
                        labelText: "name",
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.name,
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
                    SizedBox(height: 20),
                    TextFormField(
                      controller: CubitProject.phoneController,
                      decoration: const InputDecoration(
                        labelText: "Phone",
                        prefixIcon: Icon(Icons.phone),
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
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
                    SizedBox(height: 20),
                    TextFormField(
                      controller: CubitProject.addressController,
                      decoration: const InputDecoration(
                        labelText: "Address",
                        prefixIcon: Icon(Icons.location_on),
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.name,
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
                    SizedBox(height: 20),
                    ElevatedButton(
                      // color: Colors.green,
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(40),
                      ),
                      child: Text(
                        "Done",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        print(CubitProject.name);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => wastebasket(
                              isNewOrder: true,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
