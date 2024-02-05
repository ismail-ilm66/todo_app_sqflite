import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_sqflite/routes/routes_path.dart';
import 'package:todo_app_sqflite/widgets/common_text_field.dart';
import 'package:todo_app_sqflite/widgets/date_time_picker_view.dart';
import 'package:todo_app_sqflite/widgets/simple_heading.dart';
import 'package:todo_app_sqflite/widgets/simple_white_text.dart';
import 'package:todo_app_sqflite/widgets/task_categories.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({super.key});
  AddNewTask builder(BuildContext context, GoRouterState state) =>
      const AddNewTask();

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  TextEditingController? titleTextEditingController;
  TextEditingController? notesTextEditingController;
  TextEditingController? dateTextEditingController;
  TextEditingController? timeTextEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleTextEditingController = TextEditingController();
    notesTextEditingController = TextEditingController();
    dateTextEditingController = TextEditingController();
    timeTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    titleTextEditingController!.dispose();
    notesTextEditingController!.dispose();
    dateTextEditingController!.dispose();
    timeTextEditingController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            context.go(RoutesPath.home);
          },
        ),
        title: const SimpleWhiteText(text: 'Add New Task Screen'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SimpleHeading(title: 'Task Title'),
              const Gap(10),
              CommonTextField(
                  controller: titleTextEditingController!,
                  hintText: 'Task Title'),
              const Gap(20),
              const SizedBox(height: 60, child: TaskCategoriesViewer()),
              const Gap(20),
              const DateTimeViewer(),
              const Gap(20),
              const SimpleHeading(title: 'Notes'),
              const Gap(10),
              CommonTextField(
                controller: notesTextEditingController!,
                hintText: 'Notes',
                maximumLines: 7,
              ),
              const Gap(20),
              ElevatedButton(
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SimpleWhiteText(
                    text: 'Save',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
