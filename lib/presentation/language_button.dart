import 'package:flutter/material.dart';

class LanguageButton extends StatelessWidget {
  final String label;

  LanguageButton({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.black, // Background color
        ),
        child: Center(
          child: Text(
            label.toUpperCase(),
            style: TextStyle(
              color: Colors.white, // Text color
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
