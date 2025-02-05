import 'package:teachers/features/domain/entities/entities.dart';

class RatingModel extends RatingEntities {
  RatingModel({
    required super.id,
    required super.userId,
    required super.teacherId,
    required super.rating,
  });

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      id: json['id'],
      userId: json['userId'],
      teacherId: json['teacherId'],
      rating: json['rating'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "userId": userId,
      "teacherId": teacherId,
      "rating": rating,
    };
  }
}
