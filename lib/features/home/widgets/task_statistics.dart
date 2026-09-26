import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/features/home/widgets/statistic_item.dart';

class TaskStatistics extends StatelessWidget {
  const TaskStatistics({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 20.h),

      decoration: BoxDecoration(
        color: const Color(0xff515b92),
        borderRadius: BorderRadius.circular(16.r),
      ),

      child: Row(
        children: [
          const Expanded(
            child: StatisticItem(number: '12', title: 'Tasks'),
          ),

          const Expanded(
            child: StatisticItem(number: '5', title: 'Done'),
          ),

          const Expanded(
            child: StatisticItem(number: '7', title: 'Pending'),
          ),
        ],
      ),
    );
  }
}
