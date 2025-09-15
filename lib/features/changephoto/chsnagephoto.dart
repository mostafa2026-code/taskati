import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskaty/core/colors/colors.dart';
import 'package:taskaty/core/services/hive.dart';
import 'package:taskaty/features/addtask/widgets.dart';

class Chsnagephoto extends StatefulWidget {
  const Chsnagephoto({super.key});

  @override
  State<Chsnagephoto> createState() => _ChsnagephotoState();
}

class _ChsnagephotoState extends State<Chsnagephoto> {
  ImagePicker imagePicker = ImagePicker();
  XFile? image;
  final TextEditingController namecon2 = TextEditingController(
    text: HiveDate.getuserdate(HiveDate().kName),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            HiveDate.setuserdata(
              namecon2.text,
              image?.path ?? "assets/images/user 1.png",
            );
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: TaColors().blue),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.sunny))],
      ),
      body: Center(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      actions: [
                        TextButton(
                          onPressed: () async {
                            image = await imagePicker.pickImage(
                              source: ImageSource.camera,
                            );
                            setState(() {
                              if (image != null) {
                                HiveDate.userbox.put(
                                  HiveDate().kimage,
                                  image!.path,
                                );
                              }
                            });
                          },
                          child: Text("Upload From Camera"),
                        ),
                        TextButton(
                          onPressed: () async {
                            image = await imagePicker.pickImage(
                              source: ImageSource.gallery,
                            );
                            setState(() {
                              if (image != null) {
                                HiveDate.userbox.put(
                                  HiveDate().kimage,
                                  image!.path,
                                );
                              }
                            });
                          },
                          child: Text("Upload From Gallary"),
                        ),
                      ],
                    );
                  },
                );
              },

              child: CircleAvatar(
                backgroundImage: HiveDate.getuserdate(HiveDate().kimage) != null
                    ? FileImage(File(HiveDate.getuserdate(HiveDate().kimage)))
                    : AssetImage("assets/images/user 1.png"),
                child: Icon(Icons.camera_alt_outlined),
              ),
            ),
            Gap(40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  HiveDate.getuserdate(HiveDate().kName),
                  style: TextStyle(),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog.adaptive(
                          actions: [
                            TextButton(onPressed: () {}, child: Text("Cancel")),
                            TextButton(onPressed: () {}, child: Text("Ok")),
                          ],
                          content: textform(title: namecon2.text),
                        );
                      },
                    );
                  },
                  icon: Icon(Icons.edit_rounded, color: TaColors().blue),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
