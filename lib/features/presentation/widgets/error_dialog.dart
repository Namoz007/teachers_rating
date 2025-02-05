import '../../../sources.dart';

class ErrorDialog extends StatefulWidget {
  final String title;
  final String subtitle;
  ErrorDialog({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  State<ErrorDialog> createState() => _ErrorDialogState();
}

class _ErrorDialogState extends State<ErrorDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 70,
            ),
            const SizedBox(height: 30,),
            Text(widget.title,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 18,),),
            const SizedBox(height: 30,),
            Text(widget.subtitle,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,),),
            const SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                width: 180,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(32),
                ),
                alignment: Alignment.center,
                child: Text("Okay",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
