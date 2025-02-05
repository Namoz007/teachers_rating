import '../../../../sources.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      HomeScreen(),
      SearchScreen(),
      ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<ScreenControllerCubit, ScreenControllerState>(
      builder: (context, state) {
        return _screens[state.index];
      },
    ), bottomNavigationBar:
            BlocBuilder<ScreenControllerCubit, ScreenControllerState>(
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: state.index,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
          selectedItemColor: Colors.blue,
          onTap: (value) {
            context.read<ScreenControllerCubit>().newScreen(value);
          },
        );
      },
    ));
  }
}
