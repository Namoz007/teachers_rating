import '../../../sources.dart';

abstract class CommentEntities {
  String id;
  String description;
  UserModel userModel;
  DateTime created;
  String teacherId;

  CommentEntities({
    required this.id,
    required this.description,
    required this.userModel,
    required this.created,
    required this.teacherId,
  });

  Map<String,dynamic> toJson();
}
