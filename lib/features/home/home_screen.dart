import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/features/core/data/task_model.dart';
import 'package:to_do_app/features/core/utils/app_constants.dart';
import 'package:to_do_app/features/home/widgets/add_task_buttom.dart';
import 'package:to_do_app/features/home/widgets/home_header.dart';
import 'package:to_do_app/features/home/widgets/task_card.dart';
import 'package:to_do_app/features/home/widgets/task_statistics.dart';
import 'package:to_do_app/features/login/data/user_model.dart';
import 'package:to_do_app/features/task/add_task_screen.dart';
import 'package:to_do_app/gen/locale_keys.g.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserModel? getUserData() {
    return Hive.box<UserModel>(
      AppConstants.userBox,
    ).get(AppConstants.currentUser);
  }


  @override
  Widget build(BuildContext context) {
    final user = getUserData();
    return Scaffold(
      floatingActionButton: AddTaskButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTaskScreen()),
          );
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HomeHeader(name: user?.name ?? '', image: user?.image ?? ''),
              20.verticalSpace,
              TaskStatistics(),

              25.verticalSpace,

              Text(
                LocaleKeys.todays_tasks.tr(),
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff252525),
                ),
              ),

              15.verticalSpace,
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: Hive.box<TaskModel>(
                    AppConstants.tasksBox,
                  ).listenable(),

                  builder: (context, Box<TaskModel> box, _) {
                    final tasks = box.values.toList();

                    if (tasks.isEmpty) {
                      return Center(
                        child: Text(
                          'No tasks yet',
                          style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                        ),
                      );
                    }

                    return ListView.separated(
                      itemBuilder: (context, index) {
                        final task = tasks[index];

                        return TaskCard(
                          title: task.title,
                          subtitle: task.subtitle,
                          status: task.status.tr(),
                          statusColor: Color(task.color),
                          statusBackground: Color(task.color).withOpacity(0.1),
                          indicatorColor: Color(task.color),
                        );
                      },

                      separatorBuilder: (context, index) {
                        return 12.verticalSpace;
                      },

                      itemCount: tasks.length,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
