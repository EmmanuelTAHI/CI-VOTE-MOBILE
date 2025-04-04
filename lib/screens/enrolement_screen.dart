import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/primary_button.dart';
import 'dart:math';

class EnrolementScreen extends StatefulWidget {
  @override
  _EnrolementScreenState createState() => _EnrolementScreenState();
}

class _EnrolementScreenState extends State<EnrolementScreen> {
  final _nomController = TextEditingController();
  final _prenomsController = TextEditingController();
  final _cniController = TextEditingController();
  final _telephoneController = TextEditingController();

  @override
  void dispose() {
    _nomController.dispose();
    _prenomsController.dispose();
    _cniController.dispose();
    _telephoneController.dispose();
    super.dispose();
  }

  String _generateVoterId() {
    String cni = _cniController.text;
    if (cni.isEmpty) return '';
    int randomNum = Random().nextInt(9999);
    return 'VOT-${cni.substring(0, 4)}-$randomNum';
  }

  void _proceedToNextScreen() {
    if (_nomController.text.isEmpty || _cniController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Veuillez remplir le nom et le numéro de CNI')),
      );
      return;
    }
    String voterId = _generateVoterId();
    Navigator.pushNamed(
      context,
      '/home_screen',
      arguments: {
        'voterId': voterId,
        'name': _nomController.text,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
            Text(
              'Enrolement',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.amber[700],
              ),
            ),
            const SizedBox(height: 50),
            _buildInputField('Nom', _nomController),
            _buildInputField('Prénom(s)', _prenomsController),
            _buildInputField(
              'Numéro de CNI',
              _cniController,
              keyboardType: TextInputType.number,
            ),
            _buildInputField(
              'Numéro téléphonique',
              _telephoneController,
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 30),
            Center(
              child: PrimaryButton(
                text: "S'enroler",
                onPressed: _proceedToNextScreen,
                color: Colors.amber[700]!,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(
    String label,
    TextEditingController controller, {
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          SizedBox(height: 5),
          SizedBox(
            width: double.infinity,
            child: CustomTextField(
              hintText: '',
              controller: controller,
              keyboardType: keyboardType,
              obscureText: obscureText,
            ),
          ),
        ],
      ),
    );
  }
}