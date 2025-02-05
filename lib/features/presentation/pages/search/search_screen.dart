import '../../../../sources.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          onChanged: (value){
            context.read<SearchControllerCubit>().searchTeacherByName(value);
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            hintText: "Search teacher",
          ),
        ),
      ),
      body: BlocBuilder<SearchControllerCubit, SearchControllerState>(
        builder: (context, state) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemBuilder: (context, index) {
              return ShowTeacher(model: state.teachers[index]);
            },
            itemCount: state.teachers.length,
          );
        },
      ),
    );
  }
}
