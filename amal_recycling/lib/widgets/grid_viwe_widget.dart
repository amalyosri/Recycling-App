import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/constant.dart';
import 'package:graduation/controller/cubit_project.dart';
import 'package:graduation/controller/cubit_state.dart';
import 'package:graduation/ui/waste_basket_screen.dart';
import 'package:graduation/widgets/grid_view_item_wiget.dart';

class GridviweWidget extends StatelessWidget {
  const GridviweWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitProject, Projectstate>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        return Container(
          padding: const EdgeInsets.all(10.0),
          child: GridView.builder(
            itemCount: plastic_contant.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              maxCrossAxisExtent: 200,
              // mainAxisExtent: 170,
            ),
            itemBuilder: (BuildContext context, int index) {
              return GridViewItemWiget(
                index: index,
                title: plastic_contant[index].title,
                point: plastic_contant[index].point,
                image: plastic_contant[index].image,
                // count: plastic_contant[index].count,/
              );
            },
          ),
        );
      },
    );
  }
}
