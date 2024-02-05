import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_sqflite/data/temp_data.dart';
import 'package:todo_app_sqflite/routes/routes_path.dart';
import 'package:todo_app_sqflite/utilities/utils.dart';
import 'package:todo_app_sqflite/widgets/listing_of_tasks.dart';
import 'package:todo_app_sqflite/widgets/simple_white_text.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen builder(BuildContext context, GoRouterState state) =>
      const HomeScreen();
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var color = DefaultAppSettings.getColorScheme(context);
    var deviceDimensions = DefaultAppSettings.getDeviceSize(context);
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: deviceDimensions.height * 0.3,
                width: deviceDimensions.width,
                color: color.primary,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SimpleWhiteText(
                      text: '2nd February, 2024',
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                    Gap(10),
                    SimpleWhiteText(
                      text: 'My Todo List',
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 160,
            left: 0,
            right: 0,
            bottom: 0,
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ListOfTask(
                      tasks: tempData,
                      isCompletedTasksList: false,
                    ),
                    const Gap(10),
                    Text(
                      'Completed',
                      style: DefaultAppSettings.getTextTheme(context)
                          .headlineMedium!
                          .copyWith(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const Gap(10),
                    ListOfTask(
                      tasks: tempData,
                      isCompletedTasksList: true,
                    ),
                    const Gap(20),
                    ElevatedButton(
                      onPressed: () {
                        context.go(RoutesPath.createTask);
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SimpleWhiteText(
                          text: 'Add New Task',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
