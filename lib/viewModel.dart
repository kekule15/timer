import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

final homeViewModel =
    ChangeNotifierProvider.autoDispose<HomeViewModel>((ref) => HomeViewModel(ref));

class HomeViewModel extends ChangeNotifier {
  HomeViewModel(Ref read);

  bool stateValue = true;

   changeStateValue() {
    log("message $stateValue");
    stateValue = false;
    notifyListeners();
  }

   changeStateValueToFalse() {
    log("message $stateValue");
    stateValue = true;
    notifyListeners();
  }
}
