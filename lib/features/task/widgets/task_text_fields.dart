import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/gen/locale_keys.g.dart';

class TaskTextFields extends StatelessWidget {
  final String? Function(String?)? validator;
  final int? lines;
  final Color? fillColor;
  final void Function()? ontap;
  final TextEditingController? controller;
  const TaskTextFields({
    super.key,
    this.validator,
    this.fillColor,
    this.lines,
    this.ontap,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: ontap,
      controller: controller,
      readOnly: ontap != null,
      maxLines: lines,
      decoration: InputDecoration(
        filled: fillColor != null,
        fillColor: fillColor,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: Colors.white),
        ),
      ),

      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return LocaleKeys.Please_enter_description.tr();
        }
      },
    );
  }
}
