import 'package:teachers/features/domain/entities/entities.dart';

sealed class CommentControllerEvent {}

final class GetCommentControllerEvent extends CommentControllerEvent {
  String teacherId;

  GetCommentControllerEvent({
    required this.teacherId,
  });
}

final class PostCommentControllerEvent extends CommentControllerEvent {
  CommentEntities comment;

  PostCommentControllerEvent({
    required this.comment,
  });
}

final class DeleteCommentControllerEvent extends CommentControllerEvent {
  String teacherId;
  String commentId;

  DeleteCommentControllerEvent({
    required this.teacherId,
    required this.commentId,
  });
}
