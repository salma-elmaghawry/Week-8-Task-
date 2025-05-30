import 'package:flutter/material.dart';
import 'package:week8/core/bmi_constent.dart';

class AgeSelector extends StatelessWidget {
  final int age;
  final ValueChanged<int> onChanged;

  const AgeSelector({
    super.key,
    required this.age,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Age',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          '$age Years',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Slider(
          value: age.toDouble(),
          min: BMIConstants.minAge.toDouble(),
          max: BMIConstants.maxAge.toDouble(),
          divisions: BMIConstants.maxAge - BMIConstants.minAge,
          onChanged: (value) => onChanged(value.toInt()),
          label: '$age Years',
        ),
      ],
    );
  }
}