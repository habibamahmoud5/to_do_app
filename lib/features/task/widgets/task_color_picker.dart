import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/gen/locale_keys.g.dart';

class TaskColorPicker extends StatelessWidget {
  final int? selectedColor;
  final ValueChanged<int> onColorSelected;

  const TaskColorPicker({
    super.key,
    this.selectedColor,
    required this.onColorSelected,
  });

  static const List<int> colors = [
    0xff2196F3,
    0xff4CAF50,
    0xffff9800,
    0xff9C27B0,
    0xffF44336,
    0xff009688,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.choose_color.tr(),
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
        ),

        10.verticalSpace,

        Row(
          children: colors.map((color) {
            final isSelected = selectedColor == color;

            return GestureDetector(
              onTap: () {
                onColorSelected(color);
              },
              child: Container(
                margin: EdgeInsets.only(right: 10.w),
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: Color(color),
                  shape: BoxShape.circle,
                  border: isSelected
                      ? Border.all(color: Colors.white, width: 3)
                      : null,
                ),
                child: isSelected
                    ? const Icon(Icons.check, color: Colors.white, size: 20)
                    : null,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
