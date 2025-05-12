import 'package:flutter/material.dart';
import 'package:week8/feature/BMI/data/bmi_model.dart';
import 'package:week8/feature/BMI/presentation/widgets/bmi_utils.dart';

class BmiResultCard extends StatelessWidget {
  final BmiModel bmiModel;
  final VoidCallback onRecalculate;

  const BmiResultCard({
    super.key,
    required this.bmiModel,
    required this.onRecalculate,
  });

  @override
  Widget build(BuildContext context) {
    final bmi = bmiModel.calculateBmi();
    final category = bmiModel.getBmiCategory();
    final description = bmiModel.getBmiDescription();
    final healthRisks = bmiModel.getHealthRisks();

    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Results',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Age: ${bmiModel.age} years',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Center(
              child: Text(
                'Your BMI is',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Center(
              child: Text(
                bmi.toStringAsFixed(1),
                style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            Text(
              'What is $category?',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              BmiUtils.getBmiCategoryDefinition(category, bmiModel.age),
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            if (healthRisks.isNotEmpty) ...[
              const Text(
                'Health Risks:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: healthRisks
                    .map((risk) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('• '),
                              Expanded(child: Text(risk)),
                            ],
                          ),
                        ))
                    .toList(),
              ),
            ],
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: onRecalculate,
                child: const Text('Re-calculate'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}