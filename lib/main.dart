import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get.dart';
import 'package:timer/secondpage.dart';
import 'package:timer/splash.dart';
import 'package:timer/viewModel.dart';

final switchProvider = StateProvider<bool>((ref) => true);

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  Timer? _timer;

  void _logOutUser() {
    Get.offAll(() => SecondPage());
    _timer?.cancel();
  }

  void _initializeTimer() {
    final turnIt = ref.read(homeViewModel).stateValue;
    if (turnIt == true) {
      log('is true');
      _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
        _logOutUser();
      });
    } else {
      log('is false');
      !_timer!.isActive;
      _timer!.cancel();
      _timer = Timer.periodic(const Duration(hours: 10), (timer) {
        // _logOutUser();
      });
    }
  }

  void _handleUserInteraction([_]) {
    if (!_timer!.isActive) {
      return;
    }
    _timer?.cancel();
    _initializeTimer();
  }

  @override
  void initState() {
    super.initState();
    _initializeTimer();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _handleUserInteraction,
      onPanDown: _handleUserInteraction,
      onScaleStart: _handleUserInteraction,
      onLongPress: () => _handleUserInteraction,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Timer',
        //theme: themeDataMode.lightTheme,
        home: const SplashView(),
      ),
    );
  }
}
