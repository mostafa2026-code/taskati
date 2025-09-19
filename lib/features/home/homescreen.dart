import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:taskaty/core/colors/colors.dart';
import 'package:taskaty/core/services/hive.dart';
import 'package:taskaty/features/addtask/addtask.dart';
import 'package:taskaty/features/addtask/model/taskmodel.dart';
import 'package:taskaty/features/addtask/widgets.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:taskaty/features/changephoto/chsnagephoto.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  String date = DateFormat("yyyy-MM-dd").format(DateTime.now()).toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24),
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

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,

                  children: [
                    IconButton(
                      onPressed: () {
                        HiveDate.changetheme();
                      },
                      icon: Icon(Icons.wb_sunny, color: Colors.amber),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Chsnagephoto(),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        backgroundImage:
                            // ignore: unnecessary_null_comparison
                            HiveDate.getuserdate(HiveDate().kimage) != null
                            ? FileImage(
                                File(HiveDate.getuserdate(HiveDate().kimage)),
                              )
                            : AssetImage("assets/images/user 1.png"),
                        radius: 26,
                      ),
                    ),
                  ],
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
            Gap(20),
            DatePicker(
              DateTime.now().subtract(Duration(days: 3)),
              height: 100,
              width: 65,
              selectionColor: TaColors().blue,
              selectedTextColor: TaColors().white,
              initialSelectedDate: DateTime.now(),
              deactivatedColor: Colors.grey.shade400,

              dayTextStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              dateTextStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              monthTextStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              onDateChange: (selectedDate) {
                setState(() {
                  date = DateFormat(
                    "yyyy-MM-dd",
                  ).format(selectedDate).toString();
                });
              },
            ),
            ValueListenableBuilder(
              valueListenable: HiveDate.taskbox.listenable(),
              builder: (BuildContext context, Box box, Widget? child) {
                List<dynamic> tasks = box.values.toList();
                List<Taskmodel> datetasks = [];
                for (var task in tasks) {
                  if (task.date == date) {
                    datetasks.add(task);
                  }
                }

                return Expanded(
                  child: ListView.separated(
                    itemCount: datetasks.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return Gap(20);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      Taskmodel model = datetasks[index];

                      return Dismissible(
                        key: UniqueKey(),
                        background: Container(
                          padding: EdgeInsets.all(24),
                          color: Color(0xff4dae50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.check),
                              Text(
                                "Completed",
                                style: TextStyle(color: TaColors().white),
                              ),
                            ],
                          ),
                        ),
                        secondaryBackground: Container(
                          padding: EdgeInsets.all(24),
                          color: TaColors().red,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.delete),
                              Text(
                                "Deleted",
                                style: TextStyle(color: TaColors().white),
                              ),
                            ],
                          ),
                        ),
                        onDismissed: (direction) {
                          if (direction == DismissDirection.startToEnd) {
                            setState(() {
                              final Taskmodel updated = model.copywith(
                                isCompleted: true,
                                colorindex: 3,
                              );
                              HiveDate.taskbox.put(model.id, updated);
                            });
                          } else {
                            setState(() {
                              HiveDate.taskbox.delete(model.id);
                            });
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(24),
                          height: 160,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: model.isCompleted ?? false
                                ? colors[3]
                                : colors[model.colorindex],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  spacing: 5,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Tasktext(model.title).medboldwhite(),
                                    Row(
                                      children: [
                                        Icon(Icons.watch_later_outlined),
                                        Tasktext(
                                          model.starttime.toString(),
                                        ).mednormalwhite(),
                                        Text("=>"),
                                        Tasktext(
                                          model.endtime.toString(),
                                        ).mednormalwhite(),
                                      ],
                                    ),
                                    Tasktext(
                                      model.description,
                                    ).mednormalwhite(),
                                  ],
                                ),
                              ),
                              IconButton.filled(
                                onPressed: () {
                                  if (model.isCompleted == true) {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog.adaptive(
                                          title: Text(
                                            "You can't edit this completed task",
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text("Ok"),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            Addtask(model: model),
                                      ),
                                    );
                                  }
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: TaColors().white,
                                  size: 20,
                                ),
                              ),
                              Container(width: .5, color: TaColors().white),
                              RotatedBox(
                                quarterTurns: 3,
                                child: Tasktext(
                                  model.isCompleted ?? false
                                      ? "Completed"
                                      : "To Do",
                                ).mednormalwhite(),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
