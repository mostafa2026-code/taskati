
import 'package:hive_flutter/hive_flutter.dart';
part 'usersmodel.g.dart';

@HiveType(typeId: 5)
class Usersmodel {
  @HiveField(7)
  final String name;
  @HiveField(8)
  final String email;
  @HiveField(9)
  final String password;

  Usersmodel({required this.name, required this.email, required this.password});
}
