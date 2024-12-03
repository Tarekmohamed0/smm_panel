import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioInterceptors {
  static Dio createAndSetupDio() {
    final dio = Dio();

    dio.options.connectTimeout = Duration(seconds: 10); //5s
    dio.options.receiveTimeout = Duration(seconds: 10);
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: true));
    return dio;
  }
}
