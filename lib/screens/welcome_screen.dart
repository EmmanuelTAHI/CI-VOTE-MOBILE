import 'package:ci_vote_mobile/screens/enrolement_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/primary_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            SvgPicture.asset(
              'assets/icons/main_vote_logo.svg',
              width: 200,
              height: 200,
            ),
            SizedBox(height: 100),

            Text(
              'CI-VOTE MOBILE',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.yellow[700],
              ),
            ),

            SizedBox(height: 200),

            // Bouton principal
            SizedBox(
              width: 450, // Largeur du bouton
              height: 50, // Hauteur du bouton
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EnrolementScreen(),
                    ), // Navigation vers SecondPage
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow[700], // Couleur de fond jaune
                  elevation: 3, // Effet d'ombre
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Coins arrondis
                  ),
                ),
                child: Text(
                  'Commencer',
                  style: TextStyle(
                    color: Colors.white, // Texte en blanc pour contraste
                    fontWeight: FontWeight.bold, // Texte en gras
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
