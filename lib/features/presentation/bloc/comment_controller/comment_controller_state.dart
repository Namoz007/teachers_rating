import 'package:teachers/features/domain/entities/comment_entities.dart';

sealed class CommentControllerState {}

final class InitialCommentControllerState extends CommentControllerState {}

final class LoadingCommentControllerState extends CommentControllerState {}

final class LoadedCommentControllerState extends CommentControllerState {
  List<CommentEntities> comments;

  LoadedCommentControllerState({
    required this.comments,
  });
}

final class ErrorCommentControllerState extends CommentControllerState {
  String message;

  ErrorCommentControllerState({
    required this.message,
  });
}
