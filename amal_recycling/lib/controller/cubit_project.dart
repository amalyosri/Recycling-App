import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:graduation/controller/cubit_state.dart';

import '../componants/database.dart';
import '../ui/home_screen.dart';
import '../ui/myorders.dart';
import '../ui/cart_order_details_screen.dart';

class CubitProject extends Cubit<Projectstate> {
  CubitProject() : super(Initialstate());

  static CubitProject get(context) => BlocProvider.of(context);

  static double itemCounte = 0;

  static double? itemPoints;

  static int indexBottomNavigator = 0;

  static double totalpoint = 0.0;

  static double get totalprice => totalpoint * 0.5;

  static double totalPointsOfPlastic = 0.0;

  static double totalPointsOfPaper = 0.0;

  static double totalPointsOfCooking = 0.0;

  static double totalPointsOfElectronics = 0.0;

  static double totalPointsOfMetals = 0.0;

  static double totalPointsOfHome = 0.0;

  static double totalPointsOfSpareparts = 0.0;

  static double totalpricevar = totalprice;

  static List screensbottomnavigator = [
    HomeScreen(),
    MyOrders(),
    wastebasket(),
  ];

  static final nameController = TextEditingController();
  static final phoneController = TextEditingController();
  static final addressController = TextEditingController();

  static List code = [];
  static List name = [];
  static List phone = [];
  static List address = [];
  static List orderPoint = [];
  static List orderPrice = [];

  static List<Map<String, dynamic>> userInfo = [];

  void myorderdata(randomNumber, price, points) {
    code.add(randomNumber);
    name.add(nameController.text);
    phone.add(phoneController.text);
    address.add(addressController.text);
    orderPoint.add(points);
    orderPrice.add(price);
    emit(Myorderdatastate());
  }

  void minuscount(int id, List<dynamic> contant) {
    var _currentItem = contant.where((element) => element.id == id).first;
    final _currentItemIndex = contant.indexWhere((element) => element.id == id);
    // if (_currentItem.count > 0) {
    //   _currentItem.count--;

    //   contant[_currentItemIndex] = _currentItem;

    //   totalpoint -= _currentItem.point;
    // }
    // if (_currentItem.count == 0) {
    //   totalpoint = _currentItem.count;
    // }

    if (_currentItem.count > 0) {
      _currentItem.count--;

      contant[_currentItemIndex] = _currentItem;

      totalpoint -= _currentItem.point;

      if (contant == plastic_contant) {
        totalPointsOfPlastic -= _currentItem.point;
      } else if (contant == paper_contant) {
        totalPointsOfPaper -= _currentItem.point;
      } else if (contant == cooking_contant) {
        totalPointsOfCooking -= _currentItem.point;
      } else if (contant == electronics_contant) {
        totalPointsOfElectronics -= _currentItem.point;
      } else if (contant == metals_contant) {
        totalPointsOfMetals -= _currentItem.point;
      } else if (contant == home_contant) {
        totalPointsOfHome -= _currentItem.point;
      } else {
        totalPointsOfSpareparts -= _currentItem.point;
      }
    }

    if (_currentItem.count == 0) {
      // totalpoint = _currentItem.count;
      if (contant == plastic_contant) {
        totalPointsOfPlastic -= _currentItem.count;
      } else if (contant == paper_contant) {
        totalPointsOfPaper -= _currentItem.count;
      } else if (contant == cooking_contant) {
        totalPointsOfCooking -= _currentItem.count;
      } else if (contant == electronics_contant) {
        totalPointsOfElectronics -= _currentItem.count;
      } else if (contant == metals_contant) {
        totalPointsOfMetals -= _currentItem.count;
      } else if (contant == home_contant) {
        totalPointsOfHome -= _currentItem.count;
      } else {
        totalPointsOfSpareparts -= _currentItem.point;
      }
    }

    // totalpoint -= _currentItem.count * _currentItem.point;
    // itemCounte > 0 ? itemCounte-- : 0;
    // itemCounte > 0 ? totalpoint = itemCounte-- : 0;
    // print(itemCounte);

    emit(Countermimusstate());
  }

  void pluscount(int id, List<dynamic> contant) {
    var _currentItem = contant.where((element) => element.id == id).first;
    final _currentItemIndex = contant.indexWhere((element) => element.id == id);
    _currentItem.count++;
    contant[_currentItemIndex] = _currentItem;

    totalpoint += _currentItem.point;

    // totalpoint = itemCounte++;

    // print(itemCounte);
    // itemPoints = double.parse((itemCounte * point).toStringAsFixed(2));

    emit(Counterplusstate());
  }

  // ${double.parse((model.count * model.point).toStringAsFixed(2))}

  void listTotalPointsPlus(int id, List<dynamic> contant, Contant model) {
    var _currentItem = contant.where((element) => element.id == id).first;
    final _currentItemIndex = contant.indexWhere((element) => element.id == id);

    if (contant == plastic_contant) {
      totalPointsOfPlastic += _currentItem.point;
    } else if (contant == paper_contant) {
      totalPointsOfPaper += _currentItem.point;
    } else if (contant == cooking_contant) {
      totalPointsOfCooking += _currentItem.point;
    } else if (contant == electronics_contant) {
      totalPointsOfElectronics += _currentItem.point;
    } else if (contant == metals_contant) {
      totalPointsOfMetals += _currentItem.point;
    } else if (contant == home_contant) {
      totalPointsOfHome += _currentItem.point;
    } else {
      totalPointsOfSpareparts += _currentItem.point;
    }
    emit(Counterplusstate());
  }

  // void listTotalPointsMinus(int id, List<dynamic> contant, Contant model) {
  //   var _currentItem = contant.where((element) => element.id == id).first;
  //   final _currentItemIndex = contant.indexWhere((element) => element.id == id);

  //   if (_currentItem.count > 0) {
  //     if (contant == plastic_contant) {
  //       totalPointsOfPlastic -= _currentItem.point;
  //     } else if (contant == paper_contant) {
  //       totalPointsOfPaper -= _currentItem.point;
  //     } else if (contant == cooking_contant) {
  //       totalPointsOfCooking -= _currentItem.point;
  //     } else if (contant == electronics_contant) {
  //       totalPointsOfElectronics -= _currentItem.point;
  //     } else if (contant == metals_contant) {
  //       totalPointsOfMetals -= _currentItem.point;
  //     } else if (contant == home_contant) {
  //       totalPointsOfHome -= _currentItem.point;
  //     } else {
  //       totalPointsOfSpareparts -= _currentItem.point;
  //     }
  //   }

  //   if (_currentItem.count == 0) {
  //     // totalpoint = _currentItem.count;
  //     if (contant == plastic_contant) {
  //       totalPointsOfPlastic -= _currentItem.point;
  //     } else if (contant == paper_contant) {
  //       totalPointsOfPaper -= _currentItem.point;
  //     } else if (contant == cooking_contant) {
  //       totalPointsOfCooking -= _currentItem.point;
  //     } else if (contant == electronics_contant) {
  //       totalPointsOfElectronics -= _currentItem.point;
  //     } else if (contant == metals_contant) {
  //       totalPointsOfMetals -= _currentItem.point;
  //     } else if (contant == home_contant) {
  //       totalPointsOfHome -= _currentItem.point;
  //     } else {
  //       totalPointsOfSpareparts -= _currentItem.point;
  //     }
  //   }

  //   emit(Counterplusstate());
  // }

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

  void bottomNavigator(val) {
    indexBottomNavigator = val;
    print(indexBottomNavigator);

    emit(IndexBottomNavigatorState());
  }

  void totalpoint_price() {
    totalpoint;

    emit(Counttotalstate());
  }
}
