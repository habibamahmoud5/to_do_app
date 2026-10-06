import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app/features/core/data/task_model.dart';
import 'package:to_do_app/features/core/utils/app_constants.dart';
import 'package:to_do_app/features/login/data/user_model.dart';
import 'package:to_do_app/to_do_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(TaskModelAdapter());

  await Hive.openBox<UserModel>(AppConstants.userBox);
  await Hive.openBox<TaskModel>(AppConstants.tasksBox);

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      startLocale: const Locale('ar'),
      child: const ToDoApp(),
    ),
  );
}
