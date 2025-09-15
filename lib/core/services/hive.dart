
import 'package:hive/hive.dart';

import 'package:taskaty/features/home/datatask/taskmodel.dart';

class HiveDate {
  static late Box userbox;
  static late Box<TaskModel> taskbox;

  final String kName = "name";
  final String kimage = "image";
  final String kisuploaded = "isuploaded";

  static initialization() async {
    Hive.registerAdapter<TaskModel>(TaskModelAdapter());
    userbox = await Hive.openBox("userbox");
    taskbox = await Hive.openBox<TaskModel>("taskbox");
  }

  static adddatetouserbox(String key, value) {
    userbox.put(key, value);
  }

  static dynamic getuserdate(String key) {
    return userbox.get(key);
  }

  static putcompleteuserdata(String name, String image) {
    adddatetouserbox(HiveDate().kName, name);
    adddatetouserbox(HiveDate().kimage, image);
    adddatetouserbox(HiveDate().kisuploaded, true);
  }

  static setuserdata(String new_name, String new_image) {
    userbox.put(HiveDate().kName, new_name);
    userbox.put(HiveDate().kimage, new_image);
  }

  static puttaskdata(key, value) {
    taskbox.put(key, value);
  }

  static gettaskdata(key) {
    taskbox.get(key);
  }
}
