import 'package:hive/hive.dart';
import 'package:taskaty/features/addtask/model/taskmodel.dart';

class HiveDate {
  static late Box userbox;
  static late Box<Taskmodel> taskbox;

  final String kName = "name";
  final String kimage = "image";
  final String kisuploaded = "isuploaded";
  final String kisdark = "isdark";

  static initialization() async {
    Hive.registerAdapter<Taskmodel>(TaskmodelAdapter());
    userbox = await Hive.openBox("userbox");
    taskbox = await Hive.openBox<Taskmodel>("taskbox");
  }

  static adddatetouserbox(String key, value) {
    userbox.put(key, value);
  }

  static dynamic getuserdate(String key) {
    return userbox.get(key);
  }

  static putcompleteuserdata(String name, String image, ) {
    adddatetouserbox(HiveDate().kName, name);
    adddatetouserbox(HiveDate().kimage, image);
    adddatetouserbox(HiveDate().kisuploaded, true);
   
  }

  static setuserdata(String newName, String newImage) {
    userbox.put(HiveDate().kName, newName);
    userbox.put(HiveDate().kimage, newImage);
  }

  static puttaskdata(key, Taskmodel value) {
    taskbox.put(key, value);
  }

  static Taskmodel? gettaskdata(key) {
    return taskbox.get(key);
  }

  static changetheme() {
    bool cashedtheme = HiveDate.userbox.get(HiveDate().kisdark) ?? false;
    HiveDate.userbox.put(HiveDate().kisdark, !cashedtheme);
  }
}
