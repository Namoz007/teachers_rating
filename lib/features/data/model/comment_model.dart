
import '../../../sources.dart';

class CommentModel extends CommentEntities {
  CommentModel({
    required super.id,
    required super.description,
    required super.userModel,
    required super.created,
    required super.teacherId,
  });

  factory CommentModel.fromJson(
    Map<String, dynamic> json,
    Map<String, dynamic> userJson,
  ) {
    return CommentModel(
      id: json['id'],
      description: json['description'],
      userModel: UserModel.fromJson(userJson),
      created: DateTime.parse(json['created']),
      teacherId: json['teacherId'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "description": description,
      "userId": userModel.id,
      "created": created.toString(),
      "teacherId": teacherId,
    };
  }
}
