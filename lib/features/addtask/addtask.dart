import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskaty/core/colors/colors.dart';
import 'package:taskaty/core/services/hive.dart';
import 'package:taskaty/features/addtask/model/taskmodel.dart';
import 'package:taskaty/features/addtask/widgets.dart';
import 'package:intl/intl.dart';

List<Color> colors = [
  TaColors().red,
  TaColors().blue,
  TaColors().orange,
  Colors.green,
];
int? currentindex;

class Addtask extends StatefulWidget {
  final Taskmodel? model;
  const Addtask({super.key, this.model});

  @override
  State<Addtask> createState() => _AddtaskState();
}

class _AddtaskState extends State<Addtask> {
  late final String title;
  late TextEditingController titlecon;

  late final String description;
  late TextEditingController descriptioncon;

  late final String date;
  late TextEditingController datecon;

  late final String start;
  late TextEditingController startcon;

  late final String end;
  late TextEditingController endcon;
  @override
  void initState() {
    super.initState();

    // لو جاي Edit هيحط قيم الـ model
    titlecon = TextEditingController(text: widget.model?.title ?? "");
    descriptioncon = TextEditingController(
      text: widget.model?.description ?? "",
    );
    datecon = TextEditingController(
      text:
          widget.model?.date ?? DateFormat("yyyy-MM-dd").format(DateTime.now()),
    );
    startcon = TextEditingController(
      text:
          widget.model?.starttime ??
          DateFormat("hh:mm a").format(DateTime.now()),
    );
    endcon = TextEditingController(
      text:
          widget.model?.endtime ?? DateFormat("hh:mm a").format(DateTime.now()),
    );

    // اللون الحالي
    currentindex = widget.model?.colorindex ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    final myFormKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Tasktext(
          widget.model == null ? "Add Task" : "Edit Task",
        ).headine(),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: myFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Gap(10),
                Tasktext("Title").medboldblack(),
                textform(
                  title: "Enter title",
                  controllor: titlecon,
                  validator: (value) {
                    if (value.toString().isEmpty || value == null) {
                      return "please enter the title";
                    }
                    return null;
                  },
                ),
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
                      initialDate: DateTime.now(),
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
                            radius: currentindex == index ? 30 : 20,
                            child: currentindex == index
                                ? Icon(Icons.check, color: TaColors().white)
                                : null,
                          ),
                        ),
                        const Gap(5),
                      ],
                    );
                  }),
                ),
                const Gap(20),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(24),
        child: Mainbuttom(
          title: widget.model == null ? "Add Task" : "Save Changes",
          ontap: () async {
            if (myFormKey.currentState!.validate()) {
              if (widget.model == null) {
                String id =
                    DateFormat("yyyy-MM-dd").format(DateTime.now()) +
                    titlecon.text;
                await HiveDate.puttaskdata(
                  id,
                  Taskmodel(
                    title: titlecon.text,
                    description: descriptioncon.text,
                    date: datecon.text,
                    starttime: startcon.text,
                    endtime: endcon.text,
                    id: id,
                    colorindex: currentindex ?? 0,
                  ),
                );
                // ignore: use_build_context_synchronously
                Navigator.pop(context);
              } else {
                final Taskmodel editedtask = widget.model!.copywith(
                  title: titlecon.text,
                  description: descriptioncon.text,
                  date: datecon.text,
                  starttime: startcon.text,
                  endtime: endcon.text,
                  id: widget.model!.id,
                  isCompleted: widget.model!.isCompleted,
                  colorindex: currentindex ?? widget.model!.colorindex,
                );
                HiveDate.taskbox.put(widget.model!.id, editedtask);
                Navigator.pop(context);
              }
            }
          },
        ),
      ),
    );
  }
}
