import 'package:flutter/material.dart';
import 'package:week8/core/bmi_constent.dart';

class WeightSelector extends StatelessWidget {
  final double weight;
  final ValueChanged<double> onChanged;

  const WeightSelector({
    super.key,
    required this.weight,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Weight',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          '${weight.toStringAsFixed(1)} kg',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Slider(
          value: weight,
          min: BMIConstants.minWeight,
          max: BMIConstants.maxWeight,
          divisions: (BMIConstants.maxWeight - BMIConstants.minWeight).toInt() * 2,
          onChanged: onChanged,
          label: '${weight.toStringAsFixed(1)} kg',
        ),
      ],
    );
  }
}