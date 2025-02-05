import '../../../sources.dart';

class UniversalButton extends StatefulWidget {
  final String buttonText;
  VoidCallback tapFunction;
  final Color buttonColor;
  UniversalButton({
    super.key,
    required this.buttonText,
    required this.tapFunction,
    required this.buttonColor,
  });

  @override
  State<UniversalButton> createState() => _UniversalButtonState();
}

class _UniversalButtonState extends State<UniversalButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.tapFunction,
      child: Container(
        width: double.infinity,
        height: 58,
        decoration: BoxDecoration(
          color: widget.buttonColor,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Text(
          widget.buttonText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
