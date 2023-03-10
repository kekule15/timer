import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:timer/readme.dart';
import 'package:timer/viewModel.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final turnIt = ref.watch(homeViewModel);
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            turnIt.changeStateValue();
            Get.to(() => ReadMe());
          },
          child: Text(
            'Home page',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
