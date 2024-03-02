import 'dart:developer';

import 'package:dio/dio.dart';

import 'dio_logger.dart';

void main() async {
  final dio = Dio()
    ..interceptors.add(
      DioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        compact: false,
        error: true,
        logPrint: (Object object) => log(object.toString()),
        maxWidth: 90,
        request: true,
      ),
    );

  try {
    await dio.get('http://www.mocky.io/v2/5d7fc75c3300000476f0b557');
  } catch (e) {
    log('$e');
  }
}
