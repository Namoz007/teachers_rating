import '../../../../sources.dart';

sealed class TeachersControllerEvent {}

final class GetAllTeachersControllerEvent extends TeachersControllerEvent {}

final class RateToTeachersControllerEvent extends TeachersControllerEvent {
  RatingEntities model;

  RateToTeachersControllerEvent({
    required this.model,
  });
}
