import '../../../sources.dart';

class CommentControllerRepository{
  final _dataSource = getIt<CommentControllerDataSource>();


  Future<List<CommentEntities>> getAllComment(String teacherId) async{
    return await _dataSource.getAllComments(teacherId);
  }

  Future<String?> postComment(CommentEntities model) async{
    return await _dataSource.postComment(model);
  }

  Future<String?> deleteComment(String teacherId,String commentId) async{
    return await _dataSource.deleteComment(commentId, teacherId);
  }
}