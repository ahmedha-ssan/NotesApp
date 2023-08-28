import 'package:hive/hive.dart';

part 'NoteModel.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(01)
  String title;
  @HiveField(02)
  String sybTitle;
  @HiveField(03)
  final String date;
  @HiveField(04)
  int color;

  NoteModel({
    required this.title,
    required this.sybTitle,
    required this.date,
    required this.color,
  });
}
