import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/controller/cubit_project.dart';
import 'package:graduation/controller/cubit_state.dart';
import 'package:graduation/widgets/bottom_navigation_widget.dart';
import 'package:graduation/widgets/grid_viwe_widget.dart';

import '../componants/database.dart';
import 'infoform.dart';
import 'cart_order_details_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  double totalpoint1 = 0.0;
  double totalprice1 = 0.0;

  Widget build(BuildContext context) {
    // TODO: implement build

    return BlocConsumer<CubitProject, Projectstate>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("separate your waste..."),
          ),
          body: DefaultTabController(
            length: 7,
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x30000000),
                        offset: Offset.zero,
                        blurRadius: 6.0,
                        spreadRadius: 3.0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                // "${CubitProject.totalPointsOfPaper.toStringAsFixed(2)}",
                                "${CubitProject.totalpoint.toStringAsFixed(2)} point - ${CubitProject.totalprice.toStringAsFixed(2)} LE",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              // const Text(
                              //   "Minimum 50 points",
                              //   style: TextStyle(
                              //     color: Colors.red,
                              //     fontSize: 18,
                              //   ),
                              // )
                            ],
                          ),
                          ElevatedButton(
                            // color: Colors.green,

                            child: Text(
                              "Next",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => InfoForm()),
                              );
                            },
                          ),
                        ],
                      ),
                      const TabBar(
                        labelColor: Colors.black,
                        isScrollable: true,
                        tabs: [
                          Tab(text: "plastic"),
                          Tab(text: "paper"),
                          Tab(text: "cooking oil"),
                          Tab(text: "electonics"),
                          Tab(text: "metals"),
                          Tab(text: "home appliances"),
                          Tab(text: "spare parts")
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      GridviweWidget(contant: plastic_contant),
                      GridviweWidget(contant: paper_contant),
                      GridviweWidget(contant: cooking_contant),
                      GridviweWidget(contant: electronics_contant),
                      GridviweWidget(contant: metals_contant),
                      GridviweWidget(contant: home_contant),
                      GridviweWidget(contant: spareparts),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}



/*const TabBar(
              labelColor: Colors.black,
              isScrollable: true,
              tabs: [
                Tab(text: "plastic"),
                Tab(text: "paper"),
                Tab(text: "cooking oil"),
                Tab(text: "electonics"),
                Tab(text: "metals"),
                Tab(text: "home appliances"),
                Tab(text: "spare parts")
              ],
            ),
          TabBarView(
            children: [
              gridviwe(),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
              Icon(Icons.directions_bike),
            ],
          ), */


/*Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${CubitProject.get(context).totalpoint} point - $totalprice1 LE",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Minimum 50 points",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                RaisedButton(
                  child: Text("Next"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => wastebasket()),
                    );
                  },
                ),
              ],
            ), */