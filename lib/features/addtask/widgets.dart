import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskaty/core/colors/colors.dart';

class textform extends StatelessWidget {
  final String title;
  final int? maxline;
  final Widget? suffix;
  final TextEditingController? controllor;
  const textform({
    super.key,
    required this.title,
    this.maxline,
    this.suffix,
    this.controllor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controllor,
      minLines: 1,
      maxLines: maxline,
      decoration: InputDecoration(hintText: title, suffixIcon: suffix),
    );
  }
}

class Hour extends StatefulWidget {
  final String type;
  final TextEditingController controller;
  const Hour({super.key, required this.type, required this.controller});

  @override
  State<Hour> createState() => _HourState();
}

class _HourState extends State<Hour> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Tasktext(widget.type).medboldblack(),
        textform(
          controllor: widget.controller,
          title: "${widget.type} hour",
          suffix: IconButton(
            onPressed: () {
              setState(() {
                showTimePicker(
                  context: context,
                  initialTime: TimeOfDay(hour: 12, minute: 00),
                );
              });
            },
            icon: Icon(Icons.access_time),
          ),
        ),
      ],
    );
  }
}




class Mainbuttom extends StatelessWidget {
  final String title;
  final Function() ontap;
  const Mainbuttom({super.key, required this.title, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: TaColors().blue,
        minimumSize: Size(double.infinity, 50),
      ),
      onPressed: ontap,
      child: Tasktext(title).mednormalwhite(),
    );
  }
}

ScaffoldFeatureController snackbar(message, page) {
  return ScaffoldMessenger.of(page).showSnackBar(
    SnackBar(
      content: Text(message),
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(20),
      backgroundColor: TaColors().red,
    ),
  );
}

