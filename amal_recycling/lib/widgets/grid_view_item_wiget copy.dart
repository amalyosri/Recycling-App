import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:graduation/controller/cubit_project.dart';
import 'package:graduation/controller/cubit_state.dart';

import '../componants/database.dart';
import '../ui/myorders.dart';

class GridViewItemWigetCopy extends StatelessWidget {
  GridViewItemWigetCopy({
    required this.index,
    required this.model,
    required this.contant,
    Key? key,
  }) : super(key: key);

  final int index;
  final Contant model;
  List<dynamic> contant;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitProject, Projectstate>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        MyOrders(model: model);
        CubitProject.itemPoints =
            double.parse((model.count * model.point).toStringAsFixed(2));
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(31, 57, 57, 57),
                offset: Offset.zero,
                blurRadius: 10.0,
                spreadRadius: 1.0,
              ),
            ],
          ),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    model.image,
                    height: 80,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          model.title,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "${model.point} point/price",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              child: const CircleAvatar(
                                radius: 12,
                                child: Text("-"),
                              ),
                              onTap: () {
                                CubitProject.get(context)
                                    .minuscount(model.id, contant);
                                // CubitProject.get(context).listTotalPointsMinus(
                                //     model.id, contant, model);
                              },
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text("${model.count}"),
                            const SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              child: const CircleAvatar(
                                radius: 12,
                                child: Text("+"),
                              ),
                              onTap: () {
                                CubitProject.get(context)
                                    .pluscount(model.id, contant);
                                CubitProject.get(context).listTotalPointsPlus(
                                    model.id, contant, model);

                                // CubitProject.counte++;
                                // print(count);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              model.count == 0
                  ? Container()
                  : Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10)),
                          color: Colors.green,
                        ),
                        height: 30,
                        width: 90,
                        alignment: Alignment.center,
                        child: Text(
                          "${CubitProject.itemPoints} P",
                          // "${CubitProject.itemPoints}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
              // count == 0
              //     ? Container()
              //     : Align(
              //         alignment: Alignment.topLeft,
              //         child: IconButton(
              //           icon: const Icon(
              //             Icons.delete,
              //             color: Colors.red,
              //             size: 30,
              //           ),
              //           onPressed: () => setState(
              //             () {
              //               count = 0.0;
              //             },
              //           ),
              //         ),
              //       ),
            ],
          ),
        );
      },
    );
  }
}
