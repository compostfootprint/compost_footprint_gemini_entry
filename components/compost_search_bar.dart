import 'package:compost_footprint/style_guide/compost_colors.dart';
import 'package:flutter/material.dart';

class CompostSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String) onSubmitted;
  const CompostSearchBar(
      {super.key, required this.controller, required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: CompostColors.compostWhite,
        borderRadius: BorderRadius.circular(27),
        border: Border.all(color: CompostColors.compostBorder),
      ),
      child: Center(
        child: TextField(
          controller: controller,
          onSubmitted: onSubmitted,
          decoration: const InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(
              color: CompostColors.compostTextSecondary,
              fontSize: 17,
              fontFamily: 'SFProText',
            ),
            prefixIcon: Icon(
              Icons.search,
              color: CompostColors.compostText,
            ),
            border: InputBorder.none,
            contentPadding:
                EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
          ),
        ),
      ),
    );
  }
}
