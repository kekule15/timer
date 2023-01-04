import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';
import 'package:timer/home.dart';

class ReadMe extends ConsumerWidget {
  const ReadMe({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: InkWell(
          onTap: () {
            //Get.to(() => HomePage());
          },
          child: Text(
            'Read Me Page',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
