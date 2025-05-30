import 'package:flutter/material.dart';
import 'package:week8/core/app_colors.dart';
import 'package:week8/core/bmi_constent.dart';

enum HeightUnit { inches, feet, centimeters }

class HeightSlider extends StatelessWidget {
  final double height;
  final HeightUnit selectedUnit;
  final ValueChanged<double> onChanged;
  final ValueChanged<HeightUnit> onUnitChanged;

  const HeightSlider({
    super.key,
    required this.height,
    required this.onChanged,
    required this.selectedUnit,
    required this.onUnitChanged,
  });

  @override
  Widget build(BuildContext context) {
    const highlightColor = AppColors.primary;
    final bgColor = AppColors.primary.withOpacity(0.2);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Height',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children:
                    HeightUnit.values.map((unit) {
                      final isSelected = selectedUnit == unit;
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: GestureDetector(
                          onTap: () => onUnitChanged(unit),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  isSelected
                                      ? highlightColor
                                      : Colors.grey[700],
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              _unitText(unit),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ],
          ),
          const SizedBox(height: 25),

          Center(
            child: Text(
              height.toStringAsFixed(0),
              style: const TextStyle(
                color: AppColors.primary,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10),

          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              thumbColor: highlightColor,
              activeTrackColor: highlightColor,
              inactiveTrackColor: Colors.grey[600],
              overlayColor: highlightColor.withOpacity(0.2),
            ),
            child: Slider(
              value: height,
              min: BMIConstants.minHeight,
              max: BMIConstants.maxHeight,
              onChanged: onChanged,
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  String _unitText(HeightUnit unit) {
    switch (unit) {
      case HeightUnit.inches:
        return 'In';
      case HeightUnit.feet:
        return 'Ft';
      case HeightUnit.centimeters:
        return 'Cm';
    }
  }
}
