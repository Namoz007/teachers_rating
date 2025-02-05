import '../../../../../sources.dart';

class ShowTeacher extends StatefulWidget {
  TeacherEntities model;
  ShowTeacher({
    super.key,
    required this.model,
  });

  @override
  State<ShowTeacher> createState() => _ShowTeacherState();
}

class _ShowTeacherState extends State<ShowTeacher> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: widget.model.avatar == null
          ? Icon(
              Icons.person_pin,
              size: 40,
            )
          : Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    widget.model.avatar!,
                  ),
                ),
              ),
            ),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.model.fullName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 10,),
          Icon(Icons.star,color: Colors.orange,),
          Text(widget.model.rating.toString(),style: TextStyle(fontWeight: FontWeight.bold,),)
        ],
      ),
      subtitle: Text(
        "${widget.model.subject} teacher in ${widget.model.universityName} university!",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => ShowComments(userModel: widget.model),
            showDragHandle: true,
            isScrollControlled: true,
            useSafeArea: true
          );
        },
        child: Icon(Icons.comment),
      ),
    );
  }
}
