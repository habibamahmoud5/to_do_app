import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/gen/locale_keys.g.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  const CustomTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.done,

      decoration: InputDecoration(
        hintText: LocaleKeys.enter_full_name.tr(),

        filled: true,
        fillColor: Colors.white,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),

      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return LocaleKeys.enter_name_error.tr();
        }

        return null;
      },
    );
  }
}
