import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileImage extends StatelessWidget {
  final String image;

  const ProfileImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    final hasImage = image.isNotEmpty && File(image).existsSync();

    return CircleAvatar(
      radius: 30.r,
      backgroundColor: const Color(0xff515b92),
      backgroundImage: hasImage ? FileImage(File(image)) : null,
      child: !hasImage
          ? Icon(Icons.person, size: 30.sp, color: const Color(0xffe8ecf5))
          : null,
    );
  }
}
