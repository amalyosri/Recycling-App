import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/controller/cubit_project.dart';
import 'package:graduation/controller/cubit_state.dart';
import 'package:graduation/widgets/bottom_navigation_widget.dart';
import 'package:graduation/widgets/grid_viwe_widget.dart';

import '../constant.dart';
import 'waste_basket_screen.dart';

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
                                "${CubitProject.totalpoint}",
                                // "${CubitProject.totalpoint} point - $totalprice1 LE",
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
                                MaterialPageRoute(
                                    builder: (context) => wastebasket()),
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
                      GridviweWidget(),
                      GridviweWidget(),
                      GridviweWidget(),
                      GridviweWidget(),
                      GridviweWidget(),
                      GridviweWidget(),
                      GridviweWidget(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationWidget(),
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