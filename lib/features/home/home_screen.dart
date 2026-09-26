import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/features/home/widgets/home_header.dart';
import 'package:to_do_app/features/home/widgets/task_card.dart';
import 'package:to_do_app/features/home/widgets/task_statistics.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 24.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HomeHeader(),
                20.verticalSpace,
                TaskStatistics(),

                25.verticalSpace,

                Text(
                  "Today's Tasks",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff252525),
                  ),
                ),

                15.verticalSpace,

                const TaskCard(
                  title: 'Flutter UI',
                  subtitle: 'Build Register Screen',
                  status: 'Pending',
                  statusColor: Color(0xff2196F3),
                  statusBackground: Color(0xffE3F2FD),
                  indicatorColor: Color(0xff2196F3),
                ),

                12.verticalSpace,

                const TaskCard(
                  title: 'Workout',
                  subtitle: 'Gym at 6 PM',
                  status: 'Done',
                  statusColor: Color(0xff4CAF50),
                  statusBackground: Color(0xffE8F5E9),
                  indicatorColor: Color(0xff4CAF50),
                ),

                12.verticalSpace,

                const TaskCard(
                  title: 'Meeting',
                  subtitle: 'Team Sync',
                  status: 'In Progress',
                  statusColor: Color(0xffff9800),
                  statusBackground: Color(0xfffff3e0),
                  indicatorColor: Color(0xffff9800),
                ),

                12.verticalSpace,

                const TaskCard(
                  title: 'Read Book',
                  subtitle: 'Atomic Habits',
                  status: 'Pending',
                  statusColor: Color(0xff9C27B0),
                  statusBackground: Color(0xffF3E5F5),
                  indicatorColor: Color(0xff9C27B0),
                ),

                10.verticalSpace,

                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: FloatingActionButton.extended(
                    onPressed: () {},
                    backgroundColor: const Color(0xffDDE2FF),
                    foregroundColor: const Color(0xff515B92),
                    elevation: 2,

                    icon: const Icon(Icons.add),

                    label: const Text(
                      'Task',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
