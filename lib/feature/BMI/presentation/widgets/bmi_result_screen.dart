import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week8/core/app_colors.dart';
import 'package:week8/feature/BMI/data/bmi_model.dart';
import 'package:week8/feature/BMI/domain/cubit/bmi_cubit.dart';

class BmiResultScreen extends StatelessWidget {
  final BmiModel bmiModel;

  const BmiResultScreen({required this.bmiModel, super.key});

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Underweight':
      case 'Underweight (for age)':
        return Colors.blue;
      case 'Normal':
      case 'Normal (for age)':
        return Colors.green;
      case 'Overweight':
      case 'Overweight (for age)':
        return Colors.orange;
      case 'Obese':
      case 'Obese (for age)':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String _getCategoryTitle(String category) {
    switch (category) {
      case 'Underweight':
      case 'Underweight (for age)':
        return 'What is Underweight?';
      case 'Normal':
      case 'Normal (for age)':
        return 'What is Normal Weight?';
      case 'Overweight':
      case 'Overweight (for age)':
        return 'What is Overweight?';
      case 'Obese':
      case 'Obese (for age)':
        return 'What is Obesity?';
      default:
        return 'BMI Category Info';
    }
  }

  String _getCategoryDefinition(String category) {
    switch (category) {
      case 'Underweight':
      case 'Underweight (for age)':
        return 'Being underweight means your body weight is lower than what is considered healthy for your height and age. This might be due to insufficient nutrition or underlying health conditions.';
      case 'Normal':
      case 'Normal (for age)':
        return 'Having a normal BMI means your weight is in a healthy range for your height. It\'s important to maintain this through balanced diet and regular physical activity.';
      case 'Overweight':
      case 'Overweight (for age)':
        return 'Being overweight means having more body fat than is considered healthy for your height. A BMI between 25 and 29.9 is considered overweight.';
      case 'Obese':
      case 'Obese (for age)':
        return 'Obesity means having a high amount of body fat. A BMI of 30 or more falls in the obese range, which may increase health risks.';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final bmi = bmiModel.calculateBmi().toStringAsFixed(1);
    final category = bmiModel.getBmiCategory();
    final description = bmiModel.getBmiDescription();
    final risks = bmiModel.getHealthRisks();
    final categoryColor = _getCategoryColor(category);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Results'),
        backgroundColor: AppColors.background,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Your BMI is',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: categoryColor.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  category,
                                  style: TextStyle(
                                    color: categoryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            bmi,
                            style: const TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),

                          const SizedBox(height: 12),
                          Text(
                            description,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _getCategoryTitle(category),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _getCategoryDefinition(category),
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.warning_amber_rounded,
                              color: Colors.orangeAccent,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Health Risks:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        ...risks.map(
                          (risk) => Padding(
                            padding: const EdgeInsets.only(bottom: 6.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 4.0),
                                  child: Icon(Icons.circle, size: 6),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    risk,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () {
                context.read<BmiCubit>().reset();
                Navigator.pop(context);
              },
              icon: const Icon(Icons.refresh, color: Colors.white, size: 28),
              label: const Text(
                'Re-calculate',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
