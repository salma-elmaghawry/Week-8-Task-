import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week8/core/app_colors.dart';
import 'package:week8/core/app_images.dart';
import 'package:week8/core/bmi_constent.dart';
import 'package:week8/feature/BMI/domain/cubit/bmi_cubit.dart';
import 'package:week8/feature/BMI/presentation/widgets/bmi_result_screen.dart';
import 'package:week8/feature/BMI/presentation/widgets/gender_selector.dart';
import 'package:week8/feature/BMI/presentation/widgets/height_slider.dart';
import 'package:week8/feature/BMI/presentation/widgets/weight_selector.dart';
class BmiCalculatorScreen extends StatefulWidget {
  const BmiCalculatorScreen({super.key});
  @override
  State<BmiCalculatorScreen> createState() => _BmiCalculatorScreenState();
}

class _BmiCalculatorScreenState extends State<BmiCalculatorScreen> {
  late bool isMale;
  late double height;
  late double weight;
  late int age;
  HeightUnit selectedUnit = HeightUnit.centimeters;

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
    return BlocListener<BmiCubit, BmiState>(
      listener: (context, state) {
        if (state is BmiCalculated) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BmiResultScreen(bmiModel: state.bmiModel),
            ),
          );
        }
      },
      child: buildCalculatorContent(),
    );
  }

  Widget buildCalculatorContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.bmi,
                width: 50,
                height: 50,
                color: AppColors.primary,
              ),
              SizedBox(width: 10),
              const Text(
                'BMI Calculator',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 24),
          GenderSelector(
            isMale: isMale,
            onChanged: (male) => setState(() => isMale = male),
          ),
          const SizedBox(height: 30),
          HeightSlider(
            height: height,
            selectedUnit: selectedUnit,
            onChanged: (value) => setState(() => height = value),
            onUnitChanged: (unit) => setState(() => selectedUnit = unit),
          ),

          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MeasurementWidget(title: 'Weight', unit: 'Kg', initialValue: 80),
              SizedBox(width: 20),
              MeasurementWidget(initialValue: 20, title: 'Age', unit: 'Year'),
            ],
          ),

          const SizedBox(height: 35),
          ElevatedButton(
            onPressed: () {
               final cubit = context.read<BmiCubit>();
              cubit.calculateBmi(
                height: height,
                weight: weight,
                isMale: isMale,
                age: age,
              );
               // Navigation is already handled in the BlocListener above, so no additional code is needed here.
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              minimumSize: const Size(double.infinity, 60),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Calculate',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 10),
                Image.asset(AppImages.calc, width: 30, height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
