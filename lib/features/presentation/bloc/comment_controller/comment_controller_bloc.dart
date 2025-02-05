
import '../../../../sources.dart';

class CommentControllerBloc extends Bloc<CommentControllerEvent,CommentControllerState>{
  CommentControllerBloc() : super(InitialCommentControllerState()){
    on<GetCommentControllerEvent>(_getComments);
    on<PostCommentControllerEvent>(_postComment);
    on<DeleteCommentControllerEvent>(_deleteComment);
  }

  final _repository = getIt<CommentControllerRepository>();


  void _deleteComment(DeleteCommentControllerEvent event,emit) async{
    emit(LoadingCommentControllerState());
    final response =  await _repository.deleteComment(event.teacherId, event.commentId);
    if(response == null){
      add(GetCommentControllerEvent(teacherId: event.teacherId));
    }else{
      emit(ErrorCommentControllerState(message: response));
      add(GetCommentControllerEvent(teacherId: event.teacherId));
    }
  }

  void _postComment(PostCommentControllerEvent event,emit) async{
    emit(LoadingCommentControllerState());
    final response = await _repository.postComment(event.comment);
    if(response == null){
      add(GetCommentControllerEvent(teacherId: event.comment.teacherId));
    }else{
      emit(ErrorCommentControllerState(message: response));
      emit(InitialCommentControllerState());
    }
  }

  void _getComments(GetCommentControllerEvent event,emit) async{
    emit(LoadingCommentControllerState());
    try{
      emit(LoadedCommentControllerState(comments: await _repository.getAllComment(event.teacherId)));
    }on DioException catch(e){
      print("bu get comment dio xatosi $e");
      emit(ErrorCommentControllerState(message: "Please check your internet connection!"));
      emit(InitialCommentControllerState());
    }catch(e){
      print("bu get comment oddiy xato $e");
      emit(ErrorCommentControllerState(message: "Something went wrong!"));
      emit(InitialCommentControllerState());
    }
  }
}