import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Language extends StatelessWidget {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topEnd,
      child: PopupMenuButton<Locale>(
        color: Colors.white,
        icon: const Icon(Icons.language, color: Color(0xff515b92)),

        onSelected: (Locale locale) {
          context.setLocale(locale);
        },

        itemBuilder: (context) => [
          const PopupMenuItem(value: Locale('ar'), child: Text('العربية')),

          const PopupMenuItem(value: Locale('en'), child: Text('English')),
        ],
      ),
    );
  }
}
