import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Check if a user is signed in
  User? get currentUser => _auth.currentUser;

  // Sign in with email and password
  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print("Error signing in: $e");
      return null;
    }
  }

  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Register a new user
  Future<User?> registerWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print("Error registering: $e");
      return null;
    }
  }

  // save data to collection in firestore
  Future<void> savedata(String email, String password, String role) async {
    // Save data to Firestore
    _firestore.collection('users').doc(currentUser!.uid).set({
      'email': email,
      'password': password,
      'role': role,
    });
  }

  // Any other Firebase Auth methods you may need
}
