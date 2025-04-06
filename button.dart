import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final IconData? icon; // Made icon optional, as in the second version
  final VoidCallback onPressed;
  final bool disabled;
  final String? variant; // Made variant optional, as in the first version

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.variant = 'primary', // Default to 'primary', as in the second version
    this.icon,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: disabled ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: variant == 'primary'
            ? const Color(0xFF0080FF)
            : Colors.grey, // Used grey for 'secondary' as in the first version
        foregroundColor: variant == 'primary'
            ? Colors.white
            : Colors.white, // Kept white foreground for both variants for visibility on grey
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12), // Kept padding from the second version
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: variant == 'secondary'
              ? const BorderSide(color: Color(0xFF0080FF)) // Kept border for 'secondary' from the second version
              : BorderSide.none,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 18),
            const SizedBox(width: 8),
          ],
          Text(text, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}