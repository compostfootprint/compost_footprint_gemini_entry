import 'package:compost_footprint/style_guide/compost_colors.dart';
import 'package:flutter/material.dart';

class CompostButton extends StatelessWidget {
  final String text;
  final void Function() onTap;
  const CompostButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: CompostColors.compostGreen,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'SFProText'),
          ),
        ),
      ),
    );
  }
}
