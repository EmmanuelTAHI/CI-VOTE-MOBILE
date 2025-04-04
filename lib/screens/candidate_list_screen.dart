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
  int _selectedIndex = 1;
  late String voterId; // Numéro d'électeur généré dans EnrolementScreen
  late String registeredName; // Nom saisi dans EnrolementScreen

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    voterId = args?['voterId'] ?? 'Non défini';
    registeredName = args?['name'] ?? '';
  }

  void _selectCandidate(Candidate candidate) {
    setState(() {
      _selectedCandidate = candidate;
    });
  }

  void _proceedToVoting() {
    if (_selectedCandidate != null) {
      _showVerificationDialog();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Veuillez sélectionner un candidat')),
      );
    }
  }

  void _showVerificationDialog() {
  final nameController = TextEditingController();
  final voterIdController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Vérification de l\'identité'),
      content: SingleChildScrollView(
        child: Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,  // Ajuster la taille au contenu
            children: [
              // Utilisation de Flexible au lieu de Expanded
              Flexible(
                fit: FlexFit.loose,  // Permet à l'enfant de prendre seulement l'espace nécessaire
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Nom'),
                ),
              ),
              SizedBox(height: 10),
              Flexible(
                fit: FlexFit.loose,  // Permet à l'enfant de prendre seulement l'espace nécessaire
                child: TextField(
                  controller: voterIdController,
                  decoration: InputDecoration(labelText: 'Numéro d\'électeur'),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Annuler'),
        ),
        ElevatedButton(
          onPressed: () {
            if (nameController.text == registeredName &&
                voterIdController.text == voterId) {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/voting_confirmation',
                  arguments: _selectedCandidate);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Vote accepté !')),
              );
            } else {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Nom ou numéro d\'électeur incorrect'),
                  action: SnackBarAction(
                    label: 'Réessayer',
                    onPressed: _showVerificationDialog,
                  ),
                ),
              );
            }
          },
          child: Text('Valider'),
        ),
      ],
    ),
  );
}


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home_screen');
        break;
      case 1:
        break;
      case 2:
        Navigator.pushNamed(context, '/results');
        break;
    }
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
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.how_to_vote), label: 'Vote'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Résultats'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
