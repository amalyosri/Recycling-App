import 'package:bloc/bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/constant.dart';
import 'package:graduation/controller/cubit_state.dart';

class CubitProject extends Cubit<Projectstate> {
  CubitProject() : super(Initialstate());

  static CubitProject get(context) => BlocProvider.of(context);

  static double itemCounte = 0;

  static double? itemPoints;

  static int indexBottomNavigator = 0;

  static double totalpoint = 0.0;

  static double totalprice = 0.0;

  void minuscount() {
    itemCounte > 0 ? itemCounte-- : 0;

    print(itemCounte);

    emit(Countermimusstate());
  }

  void pluscounte(int index, double point) {
    totalpoint = itemCounte++;

    print(itemCounte);
    itemPoints = double.parse((itemCounte * point).toStringAsFixed(2));

    emit(Counterplusstate());
  }

  // void totalPointsAndPrice() {
  //   plastic_contant.map((i) {
  //     totalpoint = plastic_contant[i].count1 + totalpoint;
  //     totalprice = plastic_contant[i].count1 * 0.5;
  //   }).toList();
  // }

  void bottomNavigator() {
    indexBottomNavigator++;
    print(indexBottomNavigator);

    emit(IndexBottomNavigatorState());
  }

  void totalpoint_price() {
    totalpoint;

    emit(Counttotalstate());
  }
}
