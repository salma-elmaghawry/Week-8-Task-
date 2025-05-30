import 'package:flutter/material.dart';
import 'package:week8/core/app_colors.dart';
import 'package:week8/core/app_images.dart';

class GenderSelector extends StatelessWidget {
  final bool isMale;
  final ValueChanged<bool> onChanged;

  const GenderSelector({
    super.key,
    required this.isMale,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _GenderButton(
          label: 'MALE',
          imagePath: AppImages.male,
          isSelected: isMale,
          onTap: () => onChanged(true),
        ),
        const SizedBox(width: 30),
        _GenderButton(
          imagePath: AppImages.female,
          label: 'FEMALE',
          isSelected: !isMale,
          onTap: () => onChanged(false),
        ),
      ],
    );
  }
}

class _GenderButton extends StatelessWidget {
  final String label;
  final String imagePath;
  final bool isSelected;
  final VoidCallback onTap;

  const _GenderButton({
    required this.imagePath,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const highlightColor = AppColors.primary;
    const unselectedColor = AppColors.white;
    final selectedColor = AppColors.primary.withOpacity(0.2);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 120,
        decoration: BoxDecoration(
          color: isSelected ? selectedColor : unselectedColor,
          borderRadius: BorderRadius.circular(12),
          border:
              isSelected
                  ? Border.all(color: highlightColor, width: 2)
                  : Border.all(color: highlightColor, width: 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 50,
              height: 50,
              color: AppColors.primary,
            ),
            // Icon(icon, size: 36, color: highlightColor),
            const SizedBox(height: 10),
            Text(
              label,
              style: const TextStyle(
                fontSize: 15,
                color: highlightColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
