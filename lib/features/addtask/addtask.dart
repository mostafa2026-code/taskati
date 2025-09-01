import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskaty/core/colors/colors.dart';
import 'package:taskaty/features/addtask/widgets.dart';

class Addtask extends StatefulWidget {
  const Addtask({super.key});

  @override
  State<Addtask> createState() => _AddtaskState();
}

class _AddtaskState extends State<Addtask> {
  late final String title;
  final TextEditingController titlecon = TextEditingController();

  late final String description;
  final TextEditingController descriptioncon = TextEditingController();

  late final String date;
  final TextEditingController datecon = TextEditingController();

  late final String start;
  final TextEditingController startcon = TextEditingController();

  late final String end;
  final TextEditingController endcon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        title: Tasktext("Addtask").headine(),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Gap(10),
              Tasktext("Title").medboldblack(),
              textform(title: "Enter title", controllor: titlecon),
              Gap(20),
              Tasktext("Description").medboldblack(),
              textform(
                title: "Enter description",
                maxline: 5,
                controllor: descriptioncon,
              ),
              Gap(20),
              Tasktext("Date").medboldblack(),
              textform(
                title: "Enter date",
                suffix: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.date_range),
                ),
                controllor: datecon,
              ),
              Gap(20),
              Row(
                children: [
                  Expanded(
                    child: Hour(type: "start", controller: startcon),
                  ),
                  Gap(10),
                  Expanded(
                    child: Hour(type: "End", controller: endcon),
                  ),
                ],
              ),
              Tasktext("Color").medboldblack(),
              Row(
                children: [
                  Colorcontainer(color: TaColors().blue),
                  Gap(5),
                  Colorcontainer(color: TaColors().orange),
                  Gap(5),
                  Colorcontainer(color: TaColors().red),
                ],
              ),
              Gap(20),
              Mainbuttom(
                title: "Add task",
                ontap: () {
                  title = titlecon.text;
                  description = descriptioncon.text;
                  date = datecon.text;
                  start = startcon.text;
                  end = endcon.text;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Colorcontainer extends StatefulWidget {
  final Color color;
  bool clicked = false;
  Colorcontainer({super.key, required this.color});

  @override
  State<Colorcontainer> createState() => _ColorcontainerState();
}

class _ColorcontainerState extends State<Colorcontainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.clicked = true;
        });
      },
      child: Container(
        height: widget.clicked ? 50 : 40,
        width: widget.clicked ? 50 : 40,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(widget.clicked ? 25 : 20),
        ),
        child: widget.clicked ? Icon(Icons.check) : null,
      ),
    );
  }
}
