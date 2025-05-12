import 'package:flutter/material.dart';

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
          isSelected: isMale,
          onTap: () => onChanged(true),
        ),
        const SizedBox(width: 20),
        _GenderButton(
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
  final bool isSelected;
  final VoidCallback onTap;

  const _GenderButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}