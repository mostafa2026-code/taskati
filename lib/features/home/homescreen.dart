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
              builder: (BuildContext context, dynamic value, Widget? child) {
                return Tasklistveiw(tasks: value);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Tasklistveiw extends StatefulWidget {
  const Tasklistveiw({super.key, required this.tasks});
  final Box tasks;

  @override
  State<Tasklistveiw> createState() => _TasklistveiwState();
}

class _TasklistveiwState extends State<Tasklistveiw> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: widget.tasks.length,
      separatorBuilder: (BuildContext context, int index) {
        return Gap(20);
      },
      itemBuilder: (BuildContext context, int index) {
        final key = widget.tasks.keyAt(index);
        TaskModel model = widget.tasks.get(key);
        return Dismissible(
          key: UniqueKey(),
          background: Container(
            color: Color(0xff4dae50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.check),
                Text("Completed", style: TextStyle(color: TaColors().white)),
              ],
            ),
          ),
          secondaryBackground: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.delete),
              Text("Deleted", style: TextStyle(color: TaColors().white)),
            ],
          ),
          onDismissed: (direction) {
            // if( direction ==DismissDirection.startToEnd){
            //   setState(() {
            //     model.
            //   });
            // }
            
          }
          ,
          child: Container(
            height: 150,
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Tasktext(model.title).medboldwhite(),
                      Row(
                        children: [
                          Icon(Icons.watch_later_outlined),
                          Tasktext(model.start.toString()).mednormalwhite(),
                          Tasktext(model.end.toString()).mednormalwhite(),
                        ],
                      ),
                      Tasktext(model.description).mednormalwhite(),
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
          ),
        );
      },
    );
  }
}
