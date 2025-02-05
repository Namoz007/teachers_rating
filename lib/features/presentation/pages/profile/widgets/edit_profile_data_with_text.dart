import '../../../../../sources.dart';

class EditProfileDataWithText extends StatefulWidget {
  String title;
  String hintText;
  EditProfileDataWithText({
    super.key,
    required this.title,
    required this.hintText,
  });

  @override
  State<EditProfileDataWithText> createState() =>
      _EditProfileDataWithTextState();
}

class _EditProfileDataWithTextState extends State<EditProfileDataWithText> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            controller: _textController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              hintText: widget.hintText,
            ),
          ),
        ],
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
            if(_textController.text != null && _textController.text.isNotEmpty){
              Navigator.pop(context,_textController.text);
            }else{
              Navigator.pop(context);
            }
          },
          child: Text('Save'),
        )
      ],
    );
  }
}
