import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:todo_app_sqflite/providers/category_provider.dart';
import 'package:todo_app_sqflite/utilities/task_categories.dart';
import 'package:todo_app_sqflite/widgets/circle_category_icon_viewer.dart';
import 'package:todo_app_sqflite/widgets/simple_heading.dart';

class TaskCategoriesViewer extends ConsumerWidget {
  const TaskCategoriesViewer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = TaskCategories.values.toList();
    final currentCategory = ref.watch(categoryProvider);
    return Row(
      children: [
        const Expanded(flex: 2, child: SimpleHeading(title: 'Category')),
        //Gap(5),
        Expanded(
          flex: 5,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final category = categories[index];

                return InkWell(
                  radius: 10,
                  onTap: () {
                    ref.read(categoryProvider.notifier).state = category;
                  },
                  child: CircleIconView(
                      colorCircle: category.color.withOpacity(0.5),
                      colorIcon: currentCategory == category
                          ? Theme.of(context).primaryColor
                          : category.color,
                      icon: category.icon),
                );
              },
              separatorBuilder: (context, index) {
                return const Gap(7);
              },
              itemCount: categories.length),
        )
      ],
    );
  }
}
