import 'package:flutter/cupertino.dart';

import '../../../../sources.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(UserDetails.userModel.role.name),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              getIt<SharedPreferences>().remove('email');
              Navigator.pushAndRemoveUntil(
                context,
                CupertinoPageRoute(builder: (context) => SplashScreen()),
                (bool) => false,
              );
            },
            child: Icon(
              Icons.logout,
              color: Colors.red,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: BlocBuilder<UserManagementBloc, UserManagementState>(
        builder: (context, state) {
          if (state is LoadingUserManagementState) {
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
                              image: NetworkImage(UserDetails
                                      .userModel.avatar ??
                                  "https://avatars.mds.yandex.net/i?id=2c2455cf7770e59ee741a9927c319e878e72e779-4348084-images-thumbs&n=13"))),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
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
                            if(UserDetails.userModel.role == user_role.teacher) Column(
                              children: [
                                Text("Subject",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 16)),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text("University name",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 16)),
                                const SizedBox(
                                  height: 16,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            LoadingWidget(
                              width: 170,
                              height: 20,
                              borderRadius: 8,
                              color: Colors.red,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            LoadingWidget(
                              width: 180,
                              height: 20,
                              borderRadius: 8,
                              color: Colors.red,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            LoadingWidget(
                              width: 100,
                              height: 20,
                              borderRadius: 8,
                              color: Colors.red,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            LoadingWidget(
                              width: 120,
                              height: 20,
                              borderRadius: 8,
                              color: Colors.red,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            if(UserDetails.userModel.role == user_role.teacher) Column(
                              children: [
                                LoadingWidget(
                                  width: 180,
                                  height: 20,
                                  borderRadius: 8,
                                  color: Colors.red,
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                LoadingWidget(
                                  width: 130,
                                  height: 20,
                                  borderRadius: 8,
                                  color: Colors.red,
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
                context
                    .read<UserManagementBloc>()
                    .add(GetUserManagementEvent());
              },
            );
          }

          if(state is LoadedUserManagementState){
            return ShowUserDetails(model: state.model);
          }
          return Container();
        },
      ),
    );
  }
}
