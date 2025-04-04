import 'package:ci_vote_mobile/screens/enrolement_screen.dart';
import 'package:ci_vote_mobile/screens/results_screen.dart';
import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/candidate_list_screen.dart';
import 'screens/voting_confirmation_screen.dart';
import 'screens/vote_success_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(CiVoteMobileApp());
}

class CiVoteMobileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CI-Vote Mobile',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/enrolement': (context) => EnrolementScreen(),
        '/home_screen': (context) => HomeScreen(),
        '/candidate_list': (context) => CandidateListScreen(),
        '/results': (context) => ResultsScreen(),
        '/voting_confirmation': (context) => VotingConfirmationScreen(),
        '/vote_success': (context) => VoteSuccessScreen(),
      },
    );
  }
}
