import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          color: Color(0xffe8ecf5),
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.person, size: 45.sp, color: Color(0xff515b92)),
      ),
    );
  }
}
