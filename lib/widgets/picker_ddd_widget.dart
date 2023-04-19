import 'package:flutter/material.dart';

class PickerDDD extends StatelessWidget {
  final double aspectRatio;
  final List<DropdownMenuItem<String>> items;
  final void Function(dynamic)? onChanged;
  final String? value;
  final String title;

  const PickerDDD({
    Key? key,
    this.aspectRatio = 1,
    required this.items,
    required this.onChanged,
    required this.value,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade700,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            DropdownButton(
              items: items,
              onChanged: onChanged,
              value: value,
            ),
          ],
        ),
      ),
    );
  }
}
