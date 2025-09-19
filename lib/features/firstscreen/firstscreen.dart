import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskaty/core/services/hive.dart';

import 'package:taskaty/features/addtask/widgets.dart';
import 'package:taskaty/features/home/homescreen.dart';

class Firstscreen extends StatefulWidget {
  const Firstscreen({super.key});

  @override
  State<Firstscreen> createState() => _FirstscreenState();
}

class _FirstscreenState extends State<Firstscreen> {
  String path = "";
  final TextEditingController namecontrollor = TextEditingController();
  ImagePicker image1 = ImagePicker();

  @override
  void dispose() {
    namecontrollor.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        actions: [],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: path.isNotEmpty
                  ? FileImage(File(path))
                  : AssetImage("assets/images/user 1.png"),
              radius: 60,
            ),
            const Gap(20),
            Mainbuttom(
              title: "import from camera",
              ontap: () async {
                var file = await image1.pickImage(source: ImageSource.camera);
                if (file != null) {
                  setState(() {
                    path = file.path;
                  });
                }
              },
            ),
            const Gap(20),
            Mainbuttom(
              title: "import from gallery",
              ontap: () async {
                var file = await image1.pickImage(source: ImageSource.gallery);
                if (file != null) {
                  setState(() {
                    path = file.path;
                  });
                }
              },
            ),
            const Gap(20),
            const Divider(),
            const Gap(20),
            textform(title: "Enter your name ", controllor: namecontrollor),
            const Gap(20),
            Mainbuttom(
              title: "Done",
              ontap: () {
                if (path.isEmpty && namecontrollor.text.isEmpty) {
                  snackbar(
                    "please enter your name and put your image",
                    context,
                  );
                } else if (path.isNotEmpty && namecontrollor.text.isEmpty) {
                  snackbar("please enter your name ", context);
                } else if (path.isEmpty && namecontrollor.text.isNotEmpty) {
                  snackbar("please put your image", context);
                } else if (path.isNotEmpty && namecontrollor.text.isNotEmpty) {
                  HiveDate.putcompleteuserdata(namecontrollor.text, path );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Homescreen()),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
