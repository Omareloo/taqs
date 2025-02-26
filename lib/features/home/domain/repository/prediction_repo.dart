import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:taqs/features/home/data/repository/prediction_repository.dart';

class ImplPredictionRepository extends PredictionRepository
{
  @override
  Future<int> getPrediction(List<int> features) async {
    final url = Uri.parse('http://10.0.2.2:5001/predict');

    Map<String, dynamic> body = {
      'features': features
    };

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      final prediction = json.decode(response.body)['prediction'];
      if (kDebugMode) {
        print('Prediction: $prediction');
      }
    } else {
      if (kDebugMode) {
        print('Failed to get prediction');
      }
    }
    return 0;
  }

}