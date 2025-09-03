import 'package:flutter/material.dart';
import 'package:taskaty/core/colors/colors.dart';

// ignore: camel_case_types
class textform extends StatelessWidget {
  final String title;
  final int? maxline;
  final Widget? suffix;
  final TextEditingController? controllor;
  final bool? readonly;
  final Function()? ontap;
  const textform({
    super.key,
    required this.title,
    this.maxline,
    this.suffix,
    this.controllor,
    this.readonly,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: ontap,
      readOnly: readonly ?? false,
      controller: controllor,
    
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
          readonly: true,
          ontap: () async {
            var selectedtime = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );
            if (selectedtime != null) {
              widget.controller.text =  selectedtime.format(context);
            }
          },
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
  final double? width;
  const Mainbuttom({super.key, required this.title, required this.ontap, this.width});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: TaColors().blue,
        minimumSize: Size(width?? double.infinity, 50),
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
