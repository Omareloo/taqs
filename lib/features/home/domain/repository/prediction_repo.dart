import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../../data/repository/prediction_repository.dart';

class ImplPredictionRepository implements PredictionRepository {
  @override
  Future<List<int>> getPrediction(List<int> features) async {
    final url = Uri.parse('http://192.168.1.9:5001/predict');
    final Map<String, dynamic> body = {'features': features};

    try {
      if (kDebugMode) {
        print('Sending request to: $url');
        print('Request body: $body');
      }
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(body),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> predictionList = data['prediction'];
        final List<int> prediction = predictionList.map((e) => e as int).toList();
        if (kDebugMode) {
          print('Prediction: $prediction');
        }
        return prediction; // Return the prediction
      } else {
        if (kDebugMode) {
          print('Failed to get prediction: ${response.statusCode}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('An error occurred: $e');
      }
    }
    return [];
  }
}