import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:taskaty/core/colors/colors.dart';
import 'package:taskaty/core/services/hive.dart';
import 'package:taskaty/features/addtask/addtask.dart';
import 'package:taskaty/features/addtask/widgets.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:taskaty/features/home/datatask/taskmodel.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  get index => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Tasktext(
                      "hello ${HiveDate.getuserdate(HiveDate().kName)}",
                    ).headine(),
                    Tasktext("have a nice day").mednormalblack(),
                  ],
                ),
                CircleAvatar(
                  backgroundImage:
                      // ignore: unnecessary_null_comparison
                      HiveDate.getuserdate(HiveDate().kimage) != null
                      ? FileImage(File(HiveDate.getuserdate(HiveDate().kimage)))
                      : AssetImage("assets/images/user 1.png"),
                  radius: 26,
                ),
              ],
            ),
            Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Tasktext(
                      DateFormat.yMMMMd().format(DateTime.now()),
                    ).mednormalblack(),
                    Tasktext("today").mednormalblack(),
                  ],
                ),
                Mainbuttom(
                  width: 120,
                  title: "+ Add Task",
                  ontap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Addtask();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
            DatePicker(
              DateTime.now(),
              height: 100,
              width: 65,
              selectionColor: TaColors().blue,
              selectedTextColor: TaColors().white,
              onDateChange: (selectedDate) {},
            ),
            ValueListenableBuilder(
              valueListenable: HiveDate.taskbox.listenable(),

              builder: (BuildContext context, dynamic box, Widget? child) {
                List tasks = box.values.toList();
                return Tasklistveiw(tasks: tasks, model:tasks[index] );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Tasklistveiw extends StatelessWidget {
  final TaskModel model;
  const Tasklistveiw({super.key, required this.tasks, required this.model});

  final List tasks;

  @override
  Widget build(BuildContext context) {
    
    return ListView.separated(
      itemCount: tasks.length,
      separatorBuilder: (BuildContext context, int index) {
        return Gap(20);
      },
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 150,
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Tasktext(tasks[index]).medboldwhite(),
                    Row(
                      children: [
                        Icon(Icons.watch_later_outlined),
                        Tasktext("start").mednormalwhite(),
                        Tasktext("end").mednormalwhite(),
                      ],
                    ),
                    Tasktext("descrption").mednormalwhite(),
                  ],
                ),
              ),
              Container(width: .5, color: TaColors().white),
              RotatedBox(
                quarterTurns: 2,
                child: Tasktext("to do").mednormalwhite(),
              ),
            ],
          ),
        );
      },
    );
  }
}
