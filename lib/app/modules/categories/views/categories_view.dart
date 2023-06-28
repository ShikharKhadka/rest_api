import 'package:astha/app/data/models/category_model.dart';
import 'package:astha/app/modules/CategoryDetail/views/category_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../controllers/categories_controller.dart';

final categoryResult =
    StateNotifierProvider.autoDispose<CategoriesController, List<Result>>(
        (ref) {
  return CategoriesController();
});

class Category extends ConsumerStatefulWidget {
  const Category({super.key});

  @override
  ConsumerState<Category> createState() => _CategoryState();
}

class _CategoryState extends ConsumerState<Category> {
  @override
  void initState() {
    super.initState();
    ref.read(categoryResult.notifier).getCategoryList();
  }

  @override
  Widget build(BuildContext context) {
    final result = ref.watch(categoryResult);
    final loadingState = ref.watch(categoryResult.notifier).isLoading;

    return loadingState
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
            child: CustomScrollView(
              slivers: [
                SliverStack(
                  insetOnOverlap: false,
                  children: [
                    const SliverPositioned.fill(
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 12,
                        crossAxisCount: 4,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const Icon(Icons.add),
                                Text(
                                  result[index].titleNepali,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          );
                        },
                        childCount: result.length,
                      ),
                    ),
                  ],
                ),
                SliverToBoxAdapter(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(100, (index) => Text('$index')),
                    ),
                  ),
                )
              ],
            ),
          );
  }
}
