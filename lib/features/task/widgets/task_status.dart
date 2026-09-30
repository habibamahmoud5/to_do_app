import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/gen/locale_keys.g.dart';

class TaskStatusDropdown extends StatelessWidget {
  final String selectedStatus;
  final ValueChanged<String?> onChanged;

  const TaskStatusDropdown({
    super.key,
    required this.selectedStatus,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    const statuses = ['pending', 'in_progress', 'done'];

    final currentStatus = statuses.contains(selectedStatus)
        ? selectedStatus
        : 'pending';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.status.tr(),
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),

        8.verticalSpace,

        Container(
          width: double.infinity,
          height: 60.h,
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: currentStatus,
              isExpanded: true,

              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: Color(0xff777777),
              ),

              items: [
                DropdownMenuItem(
                  value: 'pending',
                  child: Text(LocaleKeys.pending.tr()),
                ),

                DropdownMenuItem(
                  value: 'in_progress',
                  child: Text(LocaleKeys.in_progress.tr()),
                ),

                DropdownMenuItem(
                  value: 'done',
                  child: Text(LocaleKeys.done.tr()),
                ),
              ],

              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
