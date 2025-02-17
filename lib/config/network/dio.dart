import 'package:dio/dio.dart';

class DioHelper {

  static late Dio dio;
  static const String apiKey = 'c444ec3251a44159af2142146251602';
  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'YOUR_BASE_URL', // Replace with your API base URL
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        queryParameters: {
          'appId': apiKey, // Add API key as a default query parameter
        },
      ),
    );
    // Add interceptor to add API key to headers for POST requests
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (options.method == 'POST') {
            options.headers['Authorization'] = apiKey;
          }
          return handler.next(options);
        },
      ),
    );
  }


  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    final response = await dio.get(
      url,
      queryParameters: query,
    );
    return response.data;
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async {
    final response = await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
    return response.data;
  }


  static Future<Response> putData({
    required String? url,
    Map<String, dynamic>? query,
    required Map<String , dynamic> data,
  })
  async {
    final response = await dio.put(
        url!,
        queryParameters: query,
        data: data
    );
    return response.data;
  }
}
