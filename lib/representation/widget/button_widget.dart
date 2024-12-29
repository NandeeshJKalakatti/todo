import 'package:flutter/material.dart';

import '../../static/app_color.dart';
import '../../static/app_styles.dart';

class CustomSquareButton extends StatelessWidget {
  final VoidCallback onPressed;

  final String text;

  const CustomSquareButton({required this.text, required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 100, // Adjust for square size
        height: 50, // Ensure it's square
        decoration: BoxDecoration(
          color: AppColors.btn1, // Purple color
          borderRadius: BorderRadius.circular(8), // Rounded corners
        ),
        child: Center(
          child: Text(
            text,
            style: AppStyle.btn1,
          ),
        ),
      ),
    );
  }
}

class CustomSquareButton2 extends StatelessWidget {
  final VoidCallback onPressed;

  final String text;

  const CustomSquareButton2({required this.text, required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 150, // Adjust for square size
        height: 50, // Ensure it's square
        decoration: BoxDecoration(
          color: AppColors.btn1, // Purple color
          borderRadius: BorderRadius.circular(8), // Rounded corners
        ),
        child: Center(
          child: Text(
            text,
            style: AppStyle.btn1,
          ),
        ),
      ),
    );
  }
}

class squarelongbutton extends StatelessWidget {
  final VoidCallback onPressed;

  final String text;

  const squarelongbutton({required this.text, required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 350, // Adjust for square size
        height: 50, // Ensure it's square
        decoration: BoxDecoration(
          color: AppColors.btn1, // Purple color
          borderRadius: BorderRadius.circular(8), // Rounded corners
        ),
        child: Center(
          child: Text(
            text,
            style: AppStyle.btn1,
          ),
        ),
      ),
    );
  }
}

class OutlinedSquareButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const OutlinedSquareButton({
    required this.text,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 350, // Adjust for square size
        height: 50, // Ensure it's square
        decoration: BoxDecoration(
          color: Colors.transparent, // No background color
          borderRadius: BorderRadius.circular(8), // Rounded corners
          border: Border.all(
            color: AppColors.btn1, // Purple outline color
            width: 2.0, // Border thickness
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: AppStyle.btn1,
          ),
        ),
      ),
    );
  }
}

class DropdownCardWidget extends StatelessWidget {
  final String? selectedId;
  final List<String> uniqueUserIds;
  final ValueChanged<String?> onChanged;

  const DropdownCardWidget({
    Key? key,
    required this.selectedId,
    required this.uniqueUserIds,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.grey[900],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: selectedId,
            dropdownColor: Colors.grey[850], // Dropdown menu background color
            items: uniqueUserIds.map((userId) {
              return DropdownMenuItem<String>(
                value: userId.toString(),
                child: Text(
                  'User ID: $userId',
                  style: const TextStyle(color: Colors.white),
                ),
              );
            }).toList(),
            onChanged: onChanged,
            style: const TextStyle(color: Colors.white),
            icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
