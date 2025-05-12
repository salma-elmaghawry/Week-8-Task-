import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:week8/feature/BMI/data/bmi_model.dart';
import 'package:week8/feature/BMI/data/bmi_repository.dart';

part 'bmi_state.dart';

class BmiCubit extends Cubit<BmiState> {
  final BmiRepository repository;

  BmiCubit(this.repository) : super(BmiInitial());

  void calculateBmi({
    required double height,
    required double weight,
    required bool isMale,
    required int age,
  }) async {
    emit(BmiLoading());
    try {
      final bmiModel = BmiModel(
        height: height,
        weight: weight,
        isMale: isMale,
        age: age,
      );
      emit(BmiCalculated(bmiModel));
    } catch (e) {
      emit(BmiError('Failed to calculate BMI: ${e.toString()}'));
    }
  }

  void reset() {
    emit(BmiInitial());
  }
}
