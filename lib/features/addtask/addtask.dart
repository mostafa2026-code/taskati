import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskaty/core/colors/colors.dart';
import 'package:taskaty/features/addtask/widgets.dart';
import 'package:intl/intl.dart';

class Addtask extends StatefulWidget {
  const Addtask({super.key});

  @override
  State<Addtask> createState() => _AddtaskState();
}

class _AddtaskState extends State<Addtask> {
  late final String title;
  TextEditingController titlecon = TextEditingController();

  late final String description;
  TextEditingController descriptioncon = TextEditingController();

  late final String date;
  TextEditingController datecon = TextEditingController(
    text: DateFormat("yyyy-MM-dd").format(DateTime.now()),
  );

  late final String start;
  TextEditingController startcon = TextEditingController(
    text: DateFormat("hh:mm a").format(DateTime.now()),
  );

  late final String end;
  TextEditingController endcon = TextEditingController(
    text: DateFormat("hh:mm a").format(DateTime.now()),
  );

  List<Color> colors = [
    TaColors().red,
    TaColors().blue,
    TaColors().orange,
    TaColors().grey,
  ];
  int? currentindex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Tasktext("Addtask").headine(), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Gap(10),
              Tasktext("Title").medboldblack(),
              textform(title: "Enter title", controllor: titlecon),
              const Gap(20),
              Tasktext("Description").medboldblack(),
              textform(
                title: "Enter description",
                maxline: 3,
                controllor: descriptioncon,
              ),
              const Gap(20),
              Tasktext("Date").medboldblack(),
              textform(
                readonly: true,
                ontap: () async {
                  dynamic selecteddate = await showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2070),
                    initialDate: DateTime.now()
                  );
                  if (selecteddate != null) {
                    selecteddate = DateFormat(
                      "yyyy-MM-dd",
                    ).format(selecteddate);
                    datecon.text = selecteddate;
                  }
                },
                title: "Enter date",
                suffix: Icon(Icons.date_range),
                controllor: datecon,
              ),
              const Gap(20),
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
                children: List.generate(3, (index) {
                  return Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            currentindex = index;
                          });
                        },

                        child: CircleAvatar(
                          backgroundColor: colors[index],
                          child: currentindex == index
                              ? Icon(Icons.check, color: TaColors().white)
                              : null,
                          radius: currentindex == index ? 30 : 20,
                        ),
                      ),
                      const Gap(5),
                    ],
                  );
                }),
              ),
              const Gap(20),
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

              SafeArea(child: Gap(100)),
            ],
          ),
        ),
      ),
    );
  }
}
