import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final IconData? prefixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const CustomTextField({
    Key? key,
    this.controller,
    required this.hintText,
    this.prefixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon != null 
          ? Icon(prefixIcon, color: Colors.yellow[700]) 
          : null,
        
        // Style du champ de texte
        filled: true,
        fillColor: Colors.yellow[50],
        
        // Bordure par défaut
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.yellow[700]!,
            width: 1,
          ),
        ),
        
        // Bordure active (quand le champ est sélectionné)
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.yellow[200]!,
            width: 1,
          ),
        ),
        
        // Bordure focus
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.yellow[700]!,
            width: 2,
          ),
        ),
        
        // Style du texte de hint
        hintStyle: TextStyle(
          color: Colors.yellow[800]!.withOpacity(0.5),
        ),
      ),
    );
  }
}