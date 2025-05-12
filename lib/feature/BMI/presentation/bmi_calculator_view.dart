import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week8/core/bmi_constent.dart';
import 'package:week8/feature/BMI/domain/cubit/bmi_cubit.dart';
import 'package:week8/feature/BMI/presentation/widgets/age_selector.dart';
import 'package:week8/feature/BMI/presentation/widgets/bmi_result_card.dart';
import 'package:week8/feature/BMI/presentation/widgets/gender_selector.dart';
import 'package:week8/feature/BMI/presentation/widgets/height_slider.dart';
import 'package:week8/feature/BMI/presentation/widgets/weight_selector.dart';

class BmiCalculatorView extends StatefulWidget {
  const BmiCalculatorView({super.key});

  @override
  State<BmiCalculatorView> createState() => _BmiCalculatorViewState();
}

class _BmiCalculatorViewState extends State<BmiCalculatorView> {
  late bool isMale;
  late double height;
  late double weight;
  late int age;

  @override
  void initState() {
    super.initState();
    isMale = true;
    height = BMIConstants.initialHeight;
    weight = BMIConstants.initialWeight;
    age = BMIConstants.initialAge;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BmiCubit, BmiState>(
      builder: (context, state) {
        if (state is BmiCalculated) {
          return BmiResultCard(
            bmiModel: state.bmiModel,
            onRecalculate: () => context.read<BmiCubit>().reset(),
          );
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 32),
              const Text(
                'BMI Calculator',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              GenderSelector(
                isMale: isMale,
                onChanged: (male) => setState(() => isMale = male),
              ),
              const SizedBox(height: 24),
              HeightSlider(
                height: height,
                onChanged: (value) => setState(() => height = value),
              ),
              const SizedBox(height: 24),
              WeightSelector(
                weight: weight,
                onChanged: (value) => setState(() => weight = value),
              ),
              const SizedBox(height: 24),
              AgeSelector(
                age: age,
                onChanged: (value) => setState(() => age = value),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  context.read<BmiCubit>().calculateBmi(
                    height: height,
                    weight: weight,
                    isMale: isMale,
                    age: age,
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Calculate', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        );
      },
    );
  }
}
