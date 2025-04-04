import 'package:flutter/material.dart';

class ResultCandidate {
  final String name;
  final int votes;
  final double percentage;
  final bool isProvisional;

  ResultCandidate({
    required this.name, 
    required this.votes, 
    required this.percentage,
    this.isProvisional = true
  });
}

class ResultsScreen extends StatefulWidget {
  @override
  _ResultsScreenState createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  bool _showProvisionalResults = true;
  int _selectedIndex = 2; // Index initial pour l'écran Résultats

  final List<ResultCandidate> provisionalResults = [
    ResultCandidate(name: 'Gbagbo Laurent', votes: 1250000, percentage: 32.5),
    ResultCandidate(name: 'Ouattara Alassane', votes: 1750000, percentage: 45.6),
    ResultCandidate(name: 'Gnamien Konan', votes: 350000, percentage: 9.1),
    ResultCandidate(name: 'Bédié David', votes: 300000, percentage: 7.8),
    ResultCandidate(name: 'Dolon Adama', votes: 200000, percentage: 5.2),
  ];

  final List<ResultCandidate> definitivResults = [
    ResultCandidate(name: 'Gbagbo Laurent', votes: 1280000, percentage: 33.2, isProvisional: false),
    ResultCandidate(name: 'Ouattara Alassane', votes: 1800000, percentage: 46.7, isProvisional: false),
    ResultCandidate(name: 'Gnamien Konan', votes: 360000, percentage: 9.3, isProvisional: false),
    ResultCandidate(name: 'Bédié David', votes: 310000, percentage: 8.0, isProvisional: false),
    ResultCandidate(name: 'Dolon Adama', votes: 210000, percentage: 5.4, isProvisional: false),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home_screen');
        break;
      case 1:
        Navigator.pushNamed(context, '/candidate_list');
        break;
      case 2:
        // Déjà sur cet écran
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<ResultCandidate> currentResults = 
      _showProvisionalResults ? provisionalResults : definitivResults;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _showProvisionalResults 
            ? 'Résultats Provisoires' 
            : 'Résultats Définitifs',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.yellow[700],
        actions: [
          Switch(
            value: _showProvisionalResults,
            onChanged: (bool value) {
              setState(() {
                _showProvisionalResults = value;
              });
            },
            activeColor: Colors.yellow[700],
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              _showProvisionalResults
                ? 'Résultats provisoires en cours de traitement'
                : 'Résultats définitifs validés par la commission électorale',
              style: TextStyle(
                color: _showProvisionalResults ? Colors.orange : Colors.green,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: currentResults.length,
              itemBuilder: (context, index) {
                final candidate = currentResults[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(
                      candidate.name, 
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Votes: ${candidate.votes.toString()}'),
                        LinearProgressIndicator(
                          value: candidate.percentage / 100,
                          backgroundColor: Colors.grey[300],
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.yellow[700]!
                          ),
                        ),
                        Text('${candidate.percentage.toStringAsFixed(1)}%'),
                      ],
                    ),
                    trailing: Icon(
                      _showProvisionalResults 
                        ? Icons.pending_outlined 
                        : Icons.check_circle_outline,
                      color: _showProvisionalResults 
                        ? Colors.orange 
                        : Colors.green,
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Taux de participation: 78.5%',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
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