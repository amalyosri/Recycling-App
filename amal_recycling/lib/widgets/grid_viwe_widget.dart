import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:graduation/controller/cubit_project.dart';
import 'package:graduation/controller/cubit_state.dart';
import 'package:graduation/ui/cart_order_details_screen.dart';
import 'package:graduation/widgets/grid_view_item_wiget%20copy.dart';
import 'package:graduation/widgets/grid_view_item_wiget.dart';

import '../componants/database.dart';

class GridviweWidget extends StatelessWidget {
  List<dynamic> contant;

  GridviweWidget({required this.contant});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitProject, Projectstate>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        return Container(
          padding: const EdgeInsets.all(10.0),
          child: GridView.builder(
            itemCount: contant.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              maxCrossAxisExtent: 200,
              // mainAxisExtent: 170,
            ),
            itemBuilder: (BuildContext context, int index) {
              return GridViewItemWigetCopy(
                index: index,
                model: contant[index],
                contant: contant,
              );
            },
          ),
        );
      },
    );
  }
}
