import 'package:flutter/material.dart';
import 'package:week8/core/bmi_constent.dart';

class HeightSlider extends StatelessWidget {
  final double height;
  final ValueChanged<double> onChanged;

  const HeightSlider({
    super.key,
    required this.height,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Height',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          '${height.toStringAsFixed(0)} cm',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Slider(
          value: height,
          min: BMIConstants.minHeight,
          max: BMIConstants.maxHeight,
          divisions: (BMIConstants.maxHeight - BMIConstants.minHeight).toInt(),
          onChanged: onChanged,
          label: '${height.toStringAsFixed(0)} cm',
        ),
      ],
    );
  }
}