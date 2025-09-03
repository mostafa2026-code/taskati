import 'package:hive/hive.dart';

class HiveDate {
  static late Box userbox;
  static late Box taskbox;

  final String kName = "name";
  final String kimage = "image";
  final String kisuploaded = "isuploaded";

  static initialization() async {
    userbox = await Hive.openBox("userbox");
    taskbox = await Hive.openBox("taskbox");
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
}
