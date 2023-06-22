import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/recent_controller.dart';

class RecentView extends GetView<RecentController> {
  const RecentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'RecentView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
