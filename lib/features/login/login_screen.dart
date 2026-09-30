import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/features/core/utils/app_constants.dart';
import 'package:to_do_app/features/home/home_screen.dart';
import 'package:to_do_app/features/login/data/user_model.dart';
import 'package:to_do_app/features/login/widgets/buttom.dart';
import 'package:to_do_app/features/login/widgets/custom_text_field.dart';
import 'package:to_do_app/features/login/widgets/language.dart';
import 'package:to_do_app/features/login/widgets/profile_icon.dart';
import 'package:to_do_app/gen/locale_keys.g.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String? imagePath;
  final TextEditingController nameController = TextEditingController();

  void saveUserData(UserModel user) {
    Hive.box<UserModel>(AppConstants.userBox)
        .put(AppConstants.currentUser, user)
        .then((value) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        })
        .catchError((error) {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 24.w),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Language(),
                    120.verticalSpace,
                    ProfileIcon(
                      onImageSelected: (path) {
                        setState(() {
                          imagePath = path;
                        });
                      },
                    ),
                    20.verticalSpace,
                    Center(
                      child: Text(
                        LocaleKeys.create_profile.tr(),

                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    5.verticalSpace,
                    Center(
                      child: Text(
                        LocaleKeys.add_name_picture.tr(),

                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff9d9d9f),
                        ),
                      ),
                    ),
                    20.verticalSpace,
                    Text(
                      LocaleKeys.full_name.tr(),

                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    10.verticalSpace,
                    CustomTextField(controller: nameController),
                    20.verticalSpace,
                    Buttom(
                      title: LocaleKeys.continue_buttom.tr(),
                      onPressed: () {
                        saveUserData(
                          UserModel(
                            name: nameController.text.trim(),
                            image: imagePath ?? "",
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
