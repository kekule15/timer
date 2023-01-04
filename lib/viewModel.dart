import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

final homeViewModel =
    ChangeNotifierProvider<HomeViewModel>((ref) => HomeViewModel(ref));

class HomeViewModel extends ChangeNotifier {
  HomeViewModel(Ref read);

  bool stateValue = true;

  void changeStateValue() {
    log("message $stateValue");
    stateValue = false;
    notifyListeners();
  }

  void changeStateValueToFalse() {
    log("message $stateValue");
    stateValue = true;
    notifyListeners();
  }
}
