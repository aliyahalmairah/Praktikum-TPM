import 'package:hive/hive.dart';
part 'users.g.dart';

@HiveType(typeId: 0)
class Todo extends HiveObject{
  @HiveField(0)
  String? id;
  @HiveField(1)
  final String username;
  @HiveField(2)
  final String password;
  Todo({
    required this.username,
    required this.password,
  });
}