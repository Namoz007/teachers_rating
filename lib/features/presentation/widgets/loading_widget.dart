import '../../../sources.dart';

class LoadingWidget extends StatefulWidget {
  double width;
  double height;
  double borderRadius;
  Color color;
  LoadingWidget({
    super.key,
    required this.width,
    required this.height,
    required this.borderRadius,
    required this.color,
  });

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.white,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          color: widget.color,
        ),
      ),
    );
  }
}
