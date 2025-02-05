
import '../../../../sources.dart';

class ScreenControllerCubit extends Cubit<ScreenControllerState>{
  ScreenControllerCubit() : super(ScreenControllerState(index: 0));

  void newScreen(int index) => emit(ScreenControllerState(index: index));
}