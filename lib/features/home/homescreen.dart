import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskaty/core/colors/colors.dart';
import 'package:taskaty/core/services/hive.dart';
import 'package:taskaty/features/addtask/addtask.dart';
import 'package:taskaty/features/addtask/widgets.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

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
                    Tasktext("hello ${HiveDate.getuserdate(HiveDate().kName)}").headine(),
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
          ],
        ),
      ),
    );
  }
}
