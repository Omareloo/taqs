import '../../data/repository/prediction_repository.dart';

class GetPredictionUseCase {
  final PredictionRepository repository;

  GetPredictionUseCase(this.repository);

  Future<List<int>> getPrediction(List<int> parameters) async {
    return await repository.getPrediction(parameters);
  }
}