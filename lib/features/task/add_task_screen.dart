import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/features/core/data/task_model.dart';
import 'package:to_do_app/features/core/utils/app_constants.dart';
import 'package:to_do_app/features/login/widgets/buttom.dart';
import 'package:to_do_app/features/login/widgets/language.dart';
import 'package:to_do_app/features/task/widgets/task_color_picker.dart';
import 'package:to_do_app/features/task/widgets/task_status.dart';
import 'package:to_do_app/features/task/widgets/task_text_fields.dart';
import 'package:to_do_app/gen/locale_keys.g.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  int? selectedColor;
  String? taskStatus;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController subTitleController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    subTitleController.dispose();
    timeController.dispose();
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFF5F7FB),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, size: 24, color: Colors.black),
          ),
          title: Text(
            LocaleKeys.add_task.tr(),
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          actions: [Language()],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.task_title.tr(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              5.verticalSpace,
              TaskTextFields(
                fillColor: Colors.white,
                controller: titleController,
              ),
              10.verticalSpace,
              Text(
                LocaleKeys.description.tr(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              5.verticalSpace,
              TaskTextFields(
                fillColor: Colors.white,
                lines: 4,
                controller: subTitleController,
              ),
              10.verticalSpace,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          LocaleKeys.date.tr(),
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        5.verticalSpace,

                        TaskTextFields(
                          fillColor: Colors.white,
                          controller: dateController,
                          ontap: () async {
                            final DateTime? pickedDate = await showDatePicker(
                              context: context,
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2028),
                              initialDate: DateTime.now(),
                            );

                            if (pickedDate != null) {
                              dateController.text =
                                  '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}';
                            }
                          },
                        ),
                      ],
                    ),
                  ),

                  10.horizontalSpace,

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          LocaleKeys.time.tr(),
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        5.verticalSpace,

                        TaskTextFields(
                          fillColor: Colors.white,
                          controller: timeController,
                          ontap: () async {
                            final TimeOfDay? pickedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );

                            if (pickedTime != null) {
                              timeController.text = pickedTime.format(context);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              10.verticalSpace,
              TaskStatusDropdown(
                selectedStatus: taskStatus,
                onChanged: (value) {
                  setState(() {
                    taskStatus = value;
                  });
                },
              ),
              10.verticalSpace,
              TaskColorPicker(
                selectedColor: selectedColor,
                onColorSelected: (color) {
                  setState(() {
                    selectedColor = color;
                  });
                },
              ),

              40.verticalSpace,
              Buttom(
                onPressed: () async {
                  if (titleController.text.trim().isEmpty) {
                    return;
                  }

                  if (taskStatus == null) {
                    return;
                  }

                  if (selectedColor == null) {
                    return;
                  }

                  final task = TaskModel(
                    title: titleController.text.trim(),
                    subtitle: subTitleController.text.trim(),
                    status: taskStatus!,
                    color: selectedColor!,
                    date: dateController.text,
                    time: timeController.text,
                  );

                  await Hive.box<TaskModel>(AppConstants.tasksBox).add(task);

                  Navigator.pop(context);
                },
                title: LocaleKeys.save_task.tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
