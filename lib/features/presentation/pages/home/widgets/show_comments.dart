import '../../../../../sources.dart';

class ShowComments extends StatefulWidget {
  TeacherEntities userModel;
  ShowComments({
    super.key,
    required this.userModel,
  });

  @override
  State<ShowComments> createState() => _ShowCommentsState();
}

class _ShowCommentsState extends State<ShowComments> {
  @override
  void initState() {
    super.initState();
    context
        .read<CommentControllerBloc>()
        .add(GetCommentControllerEvent(teacherId: widget.userModel.id));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RefreshIndicator(
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: UserDetails.userModel.id != widget.userModel.id ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
              children: [
                const SizedBox(),
                Row(
                  children: [
                    Text(
                      "Comments (${widget.userModel.fullName})",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Icon(Icons.star,color: Colors.orange,),
                    Text(widget.userModel.rating.toStringAsFixed(1),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,),overflow: TextOverflow.ellipsis,)
                  ],
                ),
                if(UserDetails.userModel.id != widget.userModel.id) GestureDetector(
                  onTap: (){
                    showDialog(context: context, builder: (context) => WriteComment(teacherId: widget.userModel.id,),barrierDismissible: false,);
                  },
                  child: Icon(Icons.edit),
                )
              ],
            ),
            const SizedBox(height: 10,),
            if(widget.userModel.id != UserDetails.userModel.id) PickRating(teacherId: widget.userModel.id, isRated: widget.userModel.isRated, myRate: widget.userModel.myRate ?? 0,),
            const SizedBox(
              height: 20,
            ),
            BlocConsumer<CommentControllerBloc, CommentControllerState>(
              listener: (context, state) {
                if (state is ErrorCommentControllerState) {
                  showDialog(
                    context: context,
                    builder: (context) => ErrorDialog(
                        title: "Comments failed!", subtitle: state.message),
                    barrierDismissible: false,
                  );
                }
              },
              builder: (context, state) {
                if (state is LoadingCommentControllerState) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return Shimmer.fromColors(
                        child: Container(
                          width: double.infinity,
                          height: 49,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.red,
                          ),
                        ),
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.white,
                      );
                    },
                  );
                }

                if (state is LoadedCommentControllerState) {
                  return state.comments.isEmpty
                      ? Center(
                          child: Text("Comments not found!"),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: state.comments.length,
                          itemBuilder: (context, index) {
                            return ShowComment(model: state.comments[index]);
                          },
                        );
                }

                return Container();
              },
            ),
          ],
        ),
        onRefresh: () async {
          context
              .read<CommentControllerBloc>()
              .add(GetCommentControllerEvent(teacherId: widget.userModel.id));
        },
      ),
    );
  }
}
