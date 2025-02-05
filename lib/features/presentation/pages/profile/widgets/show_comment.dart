import '../../../../../sources.dart';

class ShowComment extends StatefulWidget {
  CommentEntities model;
  ShowComment({
    super.key,
    required this.model,
  });

  @override
  State<ShowComment> createState() => _ShowCommentState();
}

class _ShowCommentState extends State<ShowComment> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: widget.model.userModel.avatar == null
          ? Icon(
        Icons.person,
        size: 40,
      )
          : Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: NetworkImage(
              widget.model.userModel.avatar!,
            ),
          ),
        ),
      ),
      title: Text(widget.model.description),
      subtitle: Text(widget.model.userModel.fullName),
      trailing: widget.model.userModel.id == UserDetails.userModel.id ? Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(widget.model.userModel.id == UserDetails.userModel.id ? "me":"",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green,fontSize: 18),),
          const SizedBox(width: 10,),
          GestureDetector(
            onTap: (){
              context.read<CommentControllerBloc>().add(DeleteCommentControllerEvent(teacherId: widget.model.teacherId, commentId: widget.model.id));
            },
            child: Icon(Icons.delete,color: Colors.red,),
          )
        ],
      ): const SizedBox(),
    );
  }
}
