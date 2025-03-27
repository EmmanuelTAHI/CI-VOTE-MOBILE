import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color? textColor;
  final double? width;
  final double height;

  const PrimaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.color,
    this.textColor,
    this.width,
    this.height = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        // Couleur de fond du bouton
        backgroundColor: color,
        
        // Elevation pour un effet de profondeur
        elevation: 3,
        
        // Forme du bouton
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        
        // Taille minimale du bouton
        minimumSize: width != null 
          ? Size(width!, height) 
          : Size(double.infinity, height),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor ?? Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}