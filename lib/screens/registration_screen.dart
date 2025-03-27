import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/primary_button.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _nomController = TextEditingController();
  final _prenomsController = TextEditingController();
  final _dateNaissanceController = TextEditingController();
  final _cniController = TextEditingController();
  final _carteElecteurController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _telephoneController = TextEditingController();

  @override
  void dispose() {
    // Dispose of all controllers to prevent memory leaks
    _nomController.dispose();
    _prenomsController.dispose();
    _dateNaissanceController.dispose();
    _cniController.dispose();
    _carteElecteurController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _telephoneController.dispose();
    super.dispose();
  }

  void _proceedToNextScreen() {
    Navigator.pushNamed(context, '/home_screen');
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
            Text(
              'Inscription',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.amber[700],
              ),
            ),
            SizedBox(height: 20),
            _buildInputField('Nom', _nomController),
            _buildInputField('Prénoms', _prenomsController),
            _buildInputField(
              'Date de naissance',
              _dateNaissanceController,
              keyboardType: TextInputType.datetime,
            ),
            _buildInputField(
              'Numéro de CNI',
              _cniController,
              keyboardType: TextInputType.number,
            ),
            _buildInputField(
              "Numéro de carte d’électeur",
              _carteElecteurController,
              keyboardType: TextInputType.number,
            ),
            _buildInputField(
              'Email',
              _emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            _buildInputField(
              'Password',
              _passwordController,
              obscureText: true,
            ),
            _buildInputField(
              'Numéro téléphonique',
              _telephoneController,
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 30),
            Center(
              child: PrimaryButton(
                text: 'Enregistrer',
                onPressed: _proceedToNextScreen,
                color: Colors.amber[700]!,
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Déjà un compte? ", style: TextStyle(fontSize: 14)),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/login'),
                    child: Text(
                      "se connecter",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.amber[700],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
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
          CustomTextField(
            hintText: '',
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
          ),
        ],
      ),
    );
  }
}
