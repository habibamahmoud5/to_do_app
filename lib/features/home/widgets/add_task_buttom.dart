import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/gen/locale_keys.g.dart';

class AddTaskButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddTaskButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: const Color(0xffE3F2FD),

      onPressed: onPressed,

      label: Row(
        children: [
          Icon(Icons.add, color: const Color(0xff515b92), size: 16.sp),

          5.horizontalSpace,

          Text(
            LocaleKeys.task.tr(),
            style: TextStyle(
              color: const Color(0xff515b92),
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
