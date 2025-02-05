
import '../../sources.dart';

class DioFile {
  static final DioFile _instance = DioFile._internal();
  DioFile._internal();

  static DioFile getInstance() {
    return _instance;
  }

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://teacher-rating-530c4-default-rtdb.firebaseio.com",
      sendTimeout: const Duration(seconds: 120),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  Dio get dio => _dio;

}

