import 'package:astha/app/modules/categories/views/categories_view.dart';
import 'package:astha/app/modules/home/views/home_view.dart';
import 'package:astha/app/modules/utils/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final btmBarIndex = StateProvider<int>(
  (ref) {
    int currentIndex = 0;
    return currentIndex;
  },
);
final viewList = StateProvider<List<Widget>>(
  (ref) {
    return const [
      HomeView(key: ValueKey(NewsType.home), newsType: "sports"),
      HomeView(
        key: ValueKey(NewsType.sports),
        newsType: "politics",
      ),
      CategoriesView()
    ];
  },
);

class DashboardView extends ConsumerWidget {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DashboardView'),
        centerTitle: true,
      ),
      body: ref.watch(viewList).elementAt(ref.watch(btmBarIndex)),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: ref.watch(btmBarIndex),
        onTap: (value) {
          ref.read(btmBarIndex.notifier).state = value;
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Recent"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Categories")
        ],
      ),
    );
  }
}
