import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week8/feature/BMI/data/bmi_repository.dart';
import 'package:week8/feature/BMI/domain/cubit/bmi_cubit.dart';
import 'package:week8/feature/BMI/presentation/bmi_calculator_view.dart';

class BmiCalculatorScreen extends StatelessWidget {
  const BmiCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => BmiCubit(BmiRepository()),
        child: const BmiCalculatorView(),
      ),
    );
  }
}
