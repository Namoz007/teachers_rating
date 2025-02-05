import '../../../../sources.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TeachersControllerBloc>().add(GetAllTeachersControllerEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home screen"),
      ),
      body: BlocConsumer<TeachersControllerBloc, TeachersControllerState>(
        listener: (context, state) {
          if (state is ErrorTeachersControllerState) {
            showDialog(
              context: context,
              builder: (context) =>
                  ErrorDialog(title: "Teachers", subtitle: state.message),
              barrierDismissible: false,
            );
          }
          if(state is LoadedTeachersControllerState){
            context.read<SearchControllerCubit>().loadedTeachers(state.teachers);
          }
        },
        builder: (context, state) {
          if (state is LoadedTeachersControllerState) {
            return RefreshIndicator(
              onRefresh: () async {
                context
                    .read<TeachersControllerBloc>()
                    .add(GetAllTeachersControllerEvent());
              },
              child: ListView.builder(
                itemCount: state.teachers.length,
                itemBuilder: (context, index) {
                  return ShowTeacher(model: state.teachers[index]);
                },
              ),
            );
          }

          if (state is LoadingTeachersControllerState) {
            return ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                    width: double.infinity,
                    height: 69,
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

          return Container();
        },
      ),
    );
  }
}
