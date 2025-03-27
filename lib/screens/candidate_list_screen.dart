import 'package:flutter/material.dart';
import '../widgets/primary_button.dart';

class Candidate {
  final String name;
  final String party;

  Candidate({required this.name, required this.party});
}

class CandidateListScreen extends StatefulWidget {
  @override
  _CandidateListScreenState createState() => _CandidateListScreenState();
}

class _CandidateListScreenState extends State<CandidateListScreen> {
  final List<Candidate> candidates = [
    Candidate(name: 'Gbagbo Laurent', party: 'PPA-CI'),
    Candidate(name: 'Ouattara Alassane', party: 'RDR'),
    Candidate(name: 'Gnamien Konan', party: 'Parti indépendant'),
    Candidate(name: 'Bédié David', party: 'Parti indépendant'),
    Candidate(name: 'Dolon Adama', party: 'Parti indépendant'),
  ];

  Candidate? _selectedCandidate;
  int _selectedIndex = 1; // Ajouté pour gérer l'index sélectionné

  void _selectCandidate(Candidate candidate) {
    setState(() {
      _selectedCandidate = candidate;
    });
  }

  void _proceedToVoting() {
    if (_selectedCandidate != null) {
      Navigator.pushNamed(context, '/voting_confirmation', 
        arguments: _selectedCandidate
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Veuillez sélectionner un candidat'))
      );
    }
  }

  void _onItemTapped(int index) { // Ajouté pour gérer les taps
    setState(() {
      _selectedIndex = index;
    });
    // Ajoutez ici la logique de navigation si nécessaire
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Candidats', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.yellow[700],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: candidates.length,
              itemBuilder: (context, index) {
                final candidate = candidates[index];
                return ListTile(
                  title: Text(candidate.name),
                  subtitle: Text(candidate.party),
                  trailing: Radio<Candidate>(
                    value: candidate,
                    groupValue: _selectedCandidate,
                    onChanged: (Candidate? value) {
                      _selectCandidate(value!);
                    },
                  ),
                  onTap: () => _selectCandidate(candidate),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: PrimaryButton(
              text: 'Voter',
              onPressed: _proceedToVoting,
              color: Colors.yellow[700]!,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.how_to_vote),
            label: 'Vote',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Résultats',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}