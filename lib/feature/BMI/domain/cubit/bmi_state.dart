part of 'bmi_cubit.dart';

@immutable
sealed class BmiState {}
final class BmiInitial extends BmiState {}
class BmiLoading extends BmiState {}

class BmiCalculated extends BmiState {
  final BmiModel bmiModel;

   BmiCalculated(this.bmiModel);

  @override
  List<Object> get props => [bmiModel];
}

class BmiError extends BmiState {
  final String message;

   BmiError(this.message);

  @override
  List<Object> get props => [message];
}
