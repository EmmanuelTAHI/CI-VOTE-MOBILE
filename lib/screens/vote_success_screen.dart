import 'package:flutter/material.dart';
import '../widgets/primary_button.dart';

class VoteSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle_outline, 
                color: Colors.green, 
                size: 100
              ),
              SizedBox(height: 20),
              Text(
                'Votre vote a bien été validé',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                'Un mail de confirmation vous a été envoyé. '
                'Les résultats seront annoncés cinq jours après l\'élection.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[700]),
              ),
              SizedBox(height: 30),
              PrimaryButton(
                text: 'Retour au menu',
                onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context, 
                  '/home_screen', 
                  (route) => false
                ),
                color: Colors.yellow[700]!,
              )
            ],
          ),
        ),
      ),
    );
  }
}