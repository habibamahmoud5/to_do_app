import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:to_do_app/features/login/widgets/buttom_profile.dart';

class ProfileIcon extends StatefulWidget {
  final Function(String) onImageSelected;

  const ProfileIcon({super.key, required this.onImageSelected});

  @override
  State<ProfileIcon> createState() => _ProfileIconState();
}

class _ProfileIconState extends State<ProfileIcon> {
  final picker = ImagePicker();

  XFile? photo;

  Future<void> pickImageFormCamera() async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      setState(() {
        photo = image;
      });

      widget.onImageSelected(image.path);
    }
  }

  Future<void> pickImageFormGallery() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        photo = image;
      });

      widget.onImageSelected(image.path);
    }
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
                mainAxisSize: MainAxisSize.min,
                children: [
                  ButtomProfile(
                    onPressed: () {
                      Navigator.pop(context);
                      pickImageFormGallery();
                    },
                    title: 'Gallery',
                  ),

                  20.verticalSpace,

                  ButtomProfile(
                    onPressed: () {
                      Navigator.pop(context);
                      pickImageFormCamera();
                    },
                    title: 'Camera',
                  ),
                ],
              ),
            ),
          );
        },
        child: CircleAvatar(
          radius: 50.r,
          backgroundImage: photo != null ? FileImage(File(photo!.path)) : null,
          backgroundColor: const Color(0xffe8ecf5),
          child: photo == null
              ? Icon(Icons.person, size: 45.sp, color: const Color(0xff515b92))
              : null,
        ),
      ),
    );
  }
}
