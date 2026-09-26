import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:to_do_app/features/login/widgets/buttom_profile.dart';

class ProfileImage extends StatefulWidget {
  const ProfileImage({super.key});

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  final picker = ImagePicker();
  XFile? photo;
  pickImageFormCamera() async {
    photo = await picker.pickImage(source: ImageSource.camera);
    setState(() {});
  }

  pickImageFormGallery() async {
    photo = await picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  ButtomProfile(
                    onPressed: () {
                      Navigator.pop(context);
                      pickImageFormCamera();
                    },
                    title: 'Galary',
                  ),
                  20.verticalSpace,
                  ButtomProfile(
                    onPressed: () {
                      Navigator.pop(context);
                      pickImageFormGallery();
                    },
                    title: 'Camera',
                  ),
                ],
              ),
            ),
          );
        },
        child: CircleAvatar(
          radius: 30,

          backgroundImage: photo != null
              ? Image.file(File(photo?.path ?? "")).image
              : null,
          backgroundColor: Color(0xff515b92),
          child: photo == null
              ? Icon(Icons.person, size: 30.sp, color: Color(0xffe8ecf5))
              : null,
        ),
      ),
    );
  }
}
