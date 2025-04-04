import 'package:flutter/material.dart';
import '../widgets/primary_button.dart';
import './candidate_list_screen.dart'; // Importer le modèle de Candidate

class VotingConfirmationScreen extends StatelessWidget {
  const VotingConfirmationScreen({super.key});

  void _confirmVote(BuildContext context) {
    // Simulation de confirmation de vote
    Navigator.pushNamedAndRemoveUntil(
      context, 
      '/vote_success', 
      (route) => false
    );
  }

  @override
  Widget build(BuildContext context) {
    // Récupérer le candidat sélectionné passé comme argument
    final Candidate candidate = ModalRoute.of(context)!.settings.arguments as Candidate;

    return Scaffold(
      appBar: AppBar(
        title: Text('Confirmation de Vote', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.yellow[700],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Vous êtes sur le point de voter pour :',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                candidate.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Cette élection est conduite par la commission électorale de Côte d\'Ivoire. '
                'Vous ne pouvez voter qu\'une seule fois. Confirmez-vous votre choix ?',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[700]),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PrimaryButton(
                    text: 'Annuler',
                    onPressed: () => Navigator.pop(context),
                    color: Colors.red,
                  ),
                  SizedBox(width: 20),
                  PrimaryButton(
                    text: 'Confirmer',
                    onPressed: () => _confirmVote(context),
                    color: Colors.yellow[700]!,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}