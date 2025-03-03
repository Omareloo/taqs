abstract class PredictionRepository {
  Future<List<int>> getPrediction(List<int> features);
}