import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
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

  final tasks = [
    (
      title: LocaleKeys.flutter_ui.tr(),
      subtitle: LocaleKeys.build_register_screen.tr(),
      status: LocaleKeys.pending.tr(),
      statusColor: const Color(0xff2196F3),
      statusBackground: const Color(0xffE3F2FD),
      indicatorColor: const Color(0xff2196F3),
    ),
    (
      title: LocaleKeys.workout.tr(),
      subtitle: LocaleKeys.gym_at_6_pm.tr(),
      status: LocaleKeys.done.tr(),
      statusColor: const Color(0xff4CAF50),
      statusBackground: const Color(0xffE8F5E9),
      indicatorColor: const Color(0xff4CAF50),
    ),
    (
      title: LocaleKeys.meeting.tr(),
      subtitle: LocaleKeys.team_sync.tr(),
      status: LocaleKeys.in_progress.tr(),
      statusColor: const Color(0xffff9800),
      statusBackground: const Color(0xfffff3e0),
      indicatorColor: const Color(0xffff9800),
    ),
    (
      title: LocaleKeys.read_book.tr(),
      subtitle: LocaleKeys.atomic_habits.tr(),
      status: LocaleKeys.pending.tr(),
      statusColor: const Color(0xff9C27B0),
      statusBackground: const Color(0xffF3E5F5),
      indicatorColor: const Color(0xff9C27B0),
    ),
  ];

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
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    final task = tasks[index];

                    return TaskCard(
                      title: task.title.tr(),
                      subtitle: task.subtitle.tr(),
                      status: task.status.tr(),
                      statusColor: task.statusColor,
                      statusBackground: task.statusBackground,
                      indicatorColor: task.indicatorColor,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return 12.verticalSpace;
                  },
                  itemCount: tasks.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
