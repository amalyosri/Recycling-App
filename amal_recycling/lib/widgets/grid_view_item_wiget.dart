import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/controller/cubit_project.dart';
import 'package:graduation/controller/cubit_state.dart';

class GridViewItemWiget extends StatelessWidget {
  const GridViewItemWiget({
    required this.index,
    required this.title,
    required this.point,
    required this.image,
    Key? key,
  }) : super(key: key);

  final int index;
  final String title;
  final double point;
  final String image;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitProject, Projectstate>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
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
                  Image.network(
                    image,
                    height: 80,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "${title}",
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "${point} point/price",
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
                              child: CircleAvatar(
                                radius: 12,
                                child: Text("-"),
                              ),
                              onTap: () {
                                CubitProject.get(context).minuscount();
                              },
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              child: Text("${CubitProject.itemCounte}"),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              child: CircleAvatar(
                                radius: 12,
                                child: Text("+"),
                              ),
                              onTap: () {
                                CubitProject.get(context)
                                    .pluscounte(index, point);

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

              CubitProject.itemCounte == 0
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
                        width: 75,
                        alignment: Alignment.center,
                        child: Text(
                          "${double.parse((CubitProject.itemCounte * point).toStringAsFixed(2))}",
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
