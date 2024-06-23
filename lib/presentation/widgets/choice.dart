import 'package:flutter/material.dart';

class CustomChoiceChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomChoiceChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        label,
        style: TextStyle(
          fontSize: 16,
          decoration: isSelected ? TextDecoration.none : TextDecoration.none,
          color: isSelected ? Colors.white : Colors.grey,
          shadows: isSelected
              ? [
                  Shadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: const Offset(0, 5), // Adjust the shadow offset
                    blurRadius: 8, // Adjust the blur radius
                  ),
                ]
              : null,
        ),
      ),
    );
  }
}
