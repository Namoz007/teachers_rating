import '../../../../../sources.dart';

class WriteComment extends StatefulWidget {
  String teacherId;
  WriteComment({super.key,required this.teacherId,});

  @override
  State<WriteComment> createState() => _WriteCommentState();
}

class _WriteCommentState extends State<WriteComment> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Write comment'),
      content: TextFormField(
        controller: _textController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          hintText: "Comment",
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            context.read<CommentControllerBloc>().add(
                  PostCommentControllerEvent(
                    comment: CommentModel(
                      id: '',
                      description: _textController.text,
                      userModel:
                          UserModel.fromJson(UserDetails.userModel.toJson()),
                      created: DateTime.now(),
                      teacherId: widget.teacherId,
                    ),
                  ),
                );
          },
          child: Text("Post"),
        ),
      ],
    );
  }
}
