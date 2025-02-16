import 'package:dio/dio.dart';

class DioHelper {

  static late Dio dio;
  static void init() {
    dio = Dio( BaseOptions(
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      headers: {
        'Content-Type': 'application/json',
      },
    ));
  }

  static Future<Response> getData({
    required String? url,
    Map<String, dynamic>? query,
  })
  async {
    dio.options.headers={
      'Content-Type':'application/json',
    };
    final response = await dio.get(
        url!,
        queryParameters: query
    );
    return response.data;
  }

  static Future<Response> postData({
    required String? url,
    Map<String, dynamic>? query,
    required Map<String , dynamic> data,
  })
  async {
    dio.options.headers={
      'Content-Type':'application/json',
    };
    final respnse = await dio.post(
        url!,
        queryParameters: query,
        data: data
    );
    return respnse.data;
  }
  static Future<Response> putData({
    required String? url,
    Map<String, dynamic>? query,
    required Map<String , dynamic> data,
  })
  async {
    dio.options.headers={
      'Content-Type':'application/json',
    };
    final response = await dio.put(
        url!,
        queryParameters: query,
        data: data
    );
    return response.data;
  }
}
