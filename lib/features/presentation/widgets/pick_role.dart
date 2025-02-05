
import '../../../sources.dart';

class PickRole extends StatefulWidget {
  TextEditingController controller;
  PickRole({super.key, required this.controller});

  @override
  State<PickRole> createState() => _PickRoleState();
}

class _PickRoleState extends State<PickRole> {

  @override
  void initState() {
    super.initState();
    widget.controller.text = 'student';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Role",
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        DropdownButton(
          icon: Text(widget.controller.text),
          items: [
            DropdownMenuItem(child: const Text("student"),value: "student",),
            DropdownMenuItem(child: const Text("teacher"),value: "teacher",),
          ],
          onChanged: (value) {
            setState(() {
              widget.controller.text = value!;
            });
          },
        ),
      ],
    );
  }
}
