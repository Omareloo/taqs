import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:taqs/features/home/data/repository/prediction_repository.dart';

class ImplPredictionRepository extends PredictionRepository {

  ImplPredictionRepository();

  @override
  Future<int> getPrediction(List<int> features) async {
    final url = Uri.parse('http://192.168.1.9:5001/predict');
    Map<String, dynamic> body = {'features': features};

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(body),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final prediction = responseData['prediction'];
        if (kDebugMode) {
          print('Prediction: $prediction');
        }
        return prediction as int; // Cast to int
      } else {
        if (kDebugMode) {
          print('Failed to get prediction: ${response.statusCode}');
        }
        throw Exception('Failed to get prediction: ${response.statusCode}'); // Throw an exception
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error during prediction request: $e');
      }
      throw Exception('Error during prediction request: $e'); // Throw an exception
    }
  }
}
