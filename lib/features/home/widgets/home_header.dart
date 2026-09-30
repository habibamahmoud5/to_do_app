import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/features/home/widgets/profile_image.dart';
import 'package:to_do_app/features/login/widgets/language.dart';
import 'package:to_do_app/gen/locale_keys.g.dart';

class HomeHeader extends StatelessWidget {
  final String name;
  final String image;
  const HomeHeader({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileImage(image: image),
        10.horizontalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.good_morning.tr(),
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Color(0xff858585),
              ),
            ),

            Text(
              name,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
          ],
        ),
        Spacer(),
        Language(),
      ],
    );
  }
}
