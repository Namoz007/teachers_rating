abstract class RatingEntities {
  String id;
  String userId;
  String teacherId;
  double rating;

  RatingEntities({
    required this.id,
    required this.userId,
    required this.teacherId,
    required this.rating,
  });

  Map<String,dynamic> toJson();
}
