import '../../data/repository/prediction_repository.dart';

class GetPredictionUseCase {
  final PredictionRepository predictionRepository;

  GetPredictionUseCase(this.predictionRepository);

  Future<int> getPrediction(List<int> features) async {
    return await predictionRepository.getPrediction(features);
  }
}