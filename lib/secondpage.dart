import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';
import 'package:timer/home.dart';
import 'package:timer/viewModel.dart';

class SecondPage extends ConsumerWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
      final turnIt = ref.watch(homeViewModel);
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: InkWell(
          onTap: () {
              turnIt.changeStateValueToFalse();
            Get.to(() => HomePage());
          },
          child: Text(
            'Logout out',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
