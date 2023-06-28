import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/category_detail_controller.dart';

class CategoryDetailView extends GetView<CategoryDetailController> {
  final String name;
  const CategoryDetailView({Key? key, required this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Hero(
            tag: 'Demo0',
            child: Text(
              name,
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          centerTitle: true,
        ),
        body: const Center(child: Icon(Icons.add)));
  }
}
