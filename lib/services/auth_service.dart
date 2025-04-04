import 'dart:async';

class User {
  final String id;
  final String email;
  final String nom;
  final String prenoms;

  User({
    required this.id, 
    required this.email, 
    required this.nom, 
    required this.prenoms
  });
}

class AuthService {
  // Simulation d'une base de données d'utilisateurs
  final Map<String, Map<String, String>> _mockUserDatabase = {
    '': {
      'password': '',
      'id': '1',
      'nom': 'Doe',
      'prenoms': 'John'
    },
    'admin@civote.ci': {
      'password': 'admin123',
      'id': '2',
      'nom': 'Admin',
      'prenoms': 'CI-Vote'
    }
  };

  // Stockage de l'utilisateur actuellement connecté
  User? _currentUser;

  // Getter pour l'utilisateur actuel
  User? get currentUser => _currentUser;

  // Méthode de connexion
  Future<User> login(String email, String password) async {
    // Simulation d'un délai de connexion
    await Future.delayed(Duration(seconds: 1));

    // Vérification des identifiants
    if (_mockUserDatabase.containsKey(email)) {
      final userData = _mockUserDatabase[email]!;
      if (userData['password'] == password) {
        _currentUser = User(
          id: userData['id']!,
          email: email,
          nom: userData['nom']!,
          prenoms: userData['prenoms']!
        );
        return _currentUser!;
      }
    }

    // Échec de connexion
    throw AuthenticationException('Email ou mot de passe incorrect');
  }

  // Méthode d'inscription
  Future<User> register({
    required String email,
    required String password,
    required String nom,
    required String prenoms,
    required String dateNaissance,
    required String cni,
    required String carteElecteur,
    required String telephone,
  }) async {
    // Simulation d'un délai d'inscription
    await Future.delayed(Duration(seconds: 1));

    // Vérification si l'email existe déjà
    if (_mockUserDatabase.containsKey(email)) {
      throw AuthenticationException('Cet email est déjà utilisé');
    }

    // Génération d'un ID unique (simulation)
    final newId = DateTime.now().millisecondsSinceEpoch.toString();

    // Enregistrement dans la base de données mock
    _mockUserDatabase[email] = {
      'password': password,
      'id': newId,
      'nom': nom,
      'prenoms': prenoms
    };

    // Création et retour de l'utilisateur
    _currentUser = User(
      id: newId,
      email: email,
      nom: nom,
      prenoms: prenoms
    );

    return _currentUser!;
  }

  // Méthode de déconnexion
  Future<void> logout() async {
    await Future.delayed(Duration(seconds: 1));
    _currentUser = null;
  }

  // Méthode de récupération de mot de passe
  Future<void> resetPassword(String email) async {
    await Future.delayed(Duration(seconds: 1));
    
    // Vérification si l'email existe
    if (!_mockUserDatabase.containsKey(email)) {
      throw AuthenticationException('Aucun compte associé à cet email');
    }

    // Simulation d'envoi d'email de réinitialisation
    //print('Email de réinitialisation envoyé à $email');
  }
}

// Exception personnalisée pour la gestion des erreurs d'authentification
class AuthenticationException implements Exception {
  final String message;

  AuthenticationException(this.message);

  @override
  String toString() => 'AuthenticationException: $message';
}