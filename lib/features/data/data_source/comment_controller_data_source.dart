import 'package:dio/dio.dart';
import 'package:teachers/core/core.dart';
import 'package:teachers/features/data/model/comment_model.dart';
import 'package:teachers/features/domain/entities/comment_entities.dart';
import 'package:teachers/features/domain/entities/entities.dart';

class CommentControllerDataSource{
  final _dio = getIt<DioFile>().dio;

  Future<List<CommentEntities>> getAllComments(String teacherId) async{
    final response = await _dio.get("/comments/$teacherId.json");
    if(response.data == null) return [];
    final data = response.data as Map<String,dynamic>;
    List<CommentEntities> comments = [];
    for(int i = 0;i < data.keys.toList().length;i++){
      final user = await _dio.get("/users/${data[data.keys.toList()[i]]['userId']}.json");
      comments.add(CommentModel.fromJson(data[data.keys.toList()[i]], user.data));
    }
    return comments;
  }

  Future<String?> postComment(CommentEntities comment) async{
    try{
      final response = await _dio.post("/comments/${comment.teacherId}.json",data: comment.toJson(),);
      await _dio.patch("/comments/${comment.teacherId}/${response.data['name']}.json",data: {"id":response.data['name']},);
    }on DioException catch(e){
      return "Please check your internet connection!";
    }catch(e){
      return "Something went wrong!";
    }
  }

  Future<String?> deleteComment(String comment,String teacherId) async{
    try{
      await _dio.delete("/comments/$teacherId/$comment.json");
    }on DioException catch(e){
      return "Please check your internet connection!";
    }catch(e){
      return "Something went wrong!";
    }
  }

}