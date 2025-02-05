import '../../../../../sources.dart';

class PickRating extends StatefulWidget {
  String teacherId;
  bool isRated;
  double myRate;
  PickRating({
    super.key,
    required this.teacherId,
    required this.isRated,
    required this.myRate,
  });

  @override
  State<PickRating> createState() => _PickRatingState();
}

class _PickRatingState extends State<PickRating> {
  late double rating;

  @override
  void initState() {
    super.initState();
    rating = widget.myRate;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 5; i++)
                GestureDetector(
                  onTap: (){
                    if(!widget.isRated){
                      setState(() {
                        rating = i + 1;
                      });
                    }
                  },
                  child: rating > i
                      ? Icon(
                          Icons.star,
                          color: Colors.yellow,
                        )
                      : Icon(Icons.star_border),
                )
            ],
          ),
          const SizedBox(height: 10,),
          if(!widget.isRated) FilledButton(onPressed: (){
            Navigator.pop(context);
            context.read<TeachersControllerBloc>().add(RateToTeachersControllerEvent(model: RatingModel(id: '', userId: UserDetails.userModel.id, teacherId: widget.teacherId, rating: rating)));
          }, child: Text("Submit"),)
        ],
      ),
    );
  }
}
