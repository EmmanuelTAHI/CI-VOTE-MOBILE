import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Candidats (à remplacer plus tard par un modèle réel)
  final List<String> candidates = [
    'Gbabo Laurent',
    'Gbabo Laurent',
    'Gbabo Laurent',
    'Gbabo Laurent'
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigation entre les écrans
    switch (index) {
      case 0:
        // Déjà sur l'écran d'accueil
        break;
      case 1:
        Navigator.pushNamed(context, '/candidate_list');
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
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            // Logique pour le menu hamburger
          },
        ),
        actions: [
          IconButton(
            icon: CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: Icon(Icons.person, color: Colors.grey),
            ),
            onPressed: () {
              // Logique pour le profil utilisateur
            },
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Barre de recherche
            TextField(
              decoration: InputDecoration(
                hintText: 'Rechercher',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 20),

            // Statut du vote
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(Icons.info_outline, color: Colors.orange),
                  SizedBox(width: 10),
                  Text('Statut du vote : Vous avez déjà voté'),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Titre Candidats
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Candidats', 
                  style: TextStyle(
                    fontSize: 18, 
                    fontWeight: FontWeight.bold
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Logique pour "Voir plus"
                  },
                  child: Text(
                    'Voir plus', 
                    style: TextStyle(color: Colors.yellow[700]),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            // Liste des candidats
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: candidates.map((candidate) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey[300],
                      child: Icon(Icons.person, color: Colors.grey),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20),

            // Compte à rebours
            Container(
    
              decoration: BoxDecoration(
                
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildCountdownItem('7', 'Jours'),
                  _buildCountdownItem('1', 'Heures'),
                  _buildCountdownItem('19', 'Minutes'),
                  _buildCountdownItem('42', 'Secondes'),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Bouton Voter
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/candidate_list');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'VOTER MAINTENANT', 
                style: TextStyle(
                  color: Colors.white, 
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],
        ),
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

  // Méthode pour construire un élément du compte à rebours
  Widget _buildCountdownItem(String value, String label) {
    return Column(
      children: [
        Text(
          value, 
          style: TextStyle(
            fontSize: 24, 
            fontWeight: FontWeight.bold,
            color: Colors.yellow[700]
          ),
        ),
        Text(
          label, 
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}