import 'package:dio/dio.dart';
import 'package:dio_logger/dio_logger.dart';
import 'package:test/test.dart';

void main() async {
  test(
    'dio logger',
    () async {
      final dio = Dio();
      dio.interceptors.add(
        DioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true,
        ),
      );

      final response =
          await dio.get('https://jsonplaceholder.typicode.com/posts/1');
      expect(response.statusCode, 200);
    },
  );
}
