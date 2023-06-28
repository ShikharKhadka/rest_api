import 'package:astha/app/data/models/category_model.dart';
import 'package:astha/app/modules/categories/controllers/categories_controller.dart';
import 'package:astha/app/modules/categories/views/categories_view.dart';
import 'package:astha/app/modules/home/views/home_view.dart';
import 'package:astha/app/modules/utils/enum.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';

final btmBarIndex = StateProvider<int>(
  (ref) {
    int currentIndex = 0;
    return currentIndex;
  },
);
final categoryResult =
    StateNotifierProvider.autoDispose<CategoriesController, List<Result>>(
        (ref) {
  return CategoriesController();
});
final viewList = StateProvider<List<Widget>>(
  (ref) {
    return [
      HomeView(
          key: const ValueKey(NewsType.home),
          newsType: NewsType.home.displayName),
      HomeView(
        key: const ValueKey(NewsType.sports),
        newsType: NewsType.sports.displayName,
      ),
      const Category()
    ];
  },
);

@RoutePage()
class DashBoardView extends ConsumerStatefulWidget {
  const DashBoardView({super.key});

  @override
  ConsumerState<DashBoardView> createState() => _DashBoardViewState();
}

class _DashBoardViewState extends ConsumerState<DashBoardView> {
  @override
  void initState() {
    super.initState();
    ref.read(categoryResult.notifier).getCategoryList();
  }

  @override
  Widget build(BuildContext context) {
    final categoryList = ref.watch(categoryResult);
    return Scaffold(
      appBar: AppBar(
        title: const Text('DashboardView'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: ref.watch(viewList).elementAt(
            ref.watch(btmBarIndex),
          ),
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
      drawer: Drawer(
        child: ListView(padding: EdgeInsets.zero, children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blueAccent),
            child: Text('CompanyName'),
          ),
          ...categoryList
              .map(
                (Result category) => Column(
                  children: [
                    ListTile(
                      title: Text(
                        category.titleNepali,
                      ),
                    ),
                    const Divider(
                      thickness: 2,
                      color: Colors.grey,
                    )
                  ],
                ),
              )
              .toList(),
        ]),
      ),
    );
  }
}
