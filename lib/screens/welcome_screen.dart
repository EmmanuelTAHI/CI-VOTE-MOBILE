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

            Text('CI-VOTE MOBILE',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold, color: Colors.yellow[700]),),

            SizedBox(height: 200),
            
            // Boutons principaux
            Padding(
              padding: EdgeInsets.only(left: 70,right: 70),
              child: PrimaryButton(
                text: 'Connexion',
                onPressed: () => Navigator.pushNamed(context, '/login'),
                color: Colors.yellow[700]!,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 70,right: 70),
              child: PrimaryButton(
                text: 'Inscription',
                onPressed: () => Navigator.pushNamed(context, '/register'),
                color: Colors.yellow[700]!,
                textColor: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}