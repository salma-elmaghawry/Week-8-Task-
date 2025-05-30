class BmiRepository {
  Future<double> calculateBmi(double height, double weight) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return weight / ((height / 100) * (height / 100));
  }
}
