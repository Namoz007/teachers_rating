import '../../../../../sources.dart';

class ShowUserDetails extends StatefulWidget {
  PersonalEntities model;
  ShowUserDetails({
    super.key,
    required this.model,
  });

  @override
  State<ShowUserDetails> createState() => _ShowUserDetailsState();
}

class _ShowUserDetailsState extends State<ShowUserDetails> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 88,
              height: 88,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(UserDetails.userModel.avatar ??
                          "https://avatars.mds.yandex.net/i?id=2c2455cf7770e59ee741a9927c319e878e72e779-4348084-images-thumbs&n=13"))),
            ),
            const SizedBox(
              height: 30,
            ),
            if(widget.model.role == user_role.teacher && (widget.model.universityName == null || widget.model.subject == null )) Text('You have incomplete information.',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,),),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Full name",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(
                      height: 16,
                    ),
                    Text("E-mail ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(
                      height: 16,
                    ),
                    Text("Role ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(
                      height: 16,
                    ),
                    Text("Birthday",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(
                      height: 16,
                    ),
                    if(widget.model.role == user_role.teacher) Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Subject",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        SizedBox(
                          height: 16,
                        ),
                        Text("University name",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final data = await showDialog(
                          context: context,
                          builder: (context) => EditProfileDataWithText(
                              title: "Full name", hintText: "Full name"),
                          barrierDismissible: false,
                        );
                        if (data != null && widget.model.fullName != data) {
                          widget.model.fullName = data;
                          context.read<UserManagementBloc>().add(
                              UpdateUserManagementEvent(model: widget.model));
                        }
                      },
                      child: Text(widget.model.fullName,overflow: TextOverflow.ellipsis,),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(widget.model.email,overflow: TextOverflow.ellipsis,),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(widget.model.role.name,overflow: TextOverflow.ellipsis,),
                    const SizedBox(
                      height: 16,
                    ),
                    GestureDetector(
                        onTap: () async {
                          final data = await showDatePicker(
                            context: context,
                            firstDate: DateTime(1950),
                            lastDate: DateTime.now(),
                            barrierDismissible: false,
                          );
                          if(data != null && widget.model.birthday != data){
                            widget.model.birthday = data;
                            context.read<UserManagementBloc>().add(UpdateUserManagementEvent(model: widget.model));
                          }
                        },
                        child: Text(widget.model.birthday == null
                            ? "not available"
                            : '${widget.model.birthday!.day}.${widget.model.birthday!.month}.${widget.model.birthday!.year}-year',overflow: TextOverflow.ellipsis,)),
                    const SizedBox(height: 16,),
                    if(widget.model.role == user_role.teacher) Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                          child: Text(widget.model.subject ?? "not available",overflow: TextOverflow.ellipsis,),
                          onTap: () async {
                            final data = await showDialog(
                              context: context,
                              builder: (context) => EditProfileDataWithText(
                                  title: "Subject", hintText: "Subject name"),
                              barrierDismissible: false,
                            );
                            if (data != null && widget.model.subject != data) {
                              widget.model.subject = data;
                              context.read<UserManagementBloc>().add(
                                  UpdateUserManagementEvent(model: widget.model));
                            }
                          },
                        ),
                        SizedBox(
                          height:16,
                        ),
                        GestureDetector(
                          onTap: () async {
                            final data = await showDialog(
                              context: context,
                              builder: (context) => EditProfileDataWithText(
                                  title: "University name",
                                  hintText: "University name"),
                              barrierDismissible: false,
                            );
                            if (data != null &&
                                widget.model.universityName != data) {
                              widget.model.universityName = data;
                              context.read<UserManagementBloc>().add(
                                  UpdateUserManagementEvent(model: widget.model));
                            }
                          },
                          child:
                          Text(widget.model.universityName ?? "not available",overflow: TextOverflow.ellipsis,),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
      onRefresh: () async {
        context.read<UserManagementBloc>().add(GetUserManagementEvent());
      },
    );
  }
}
