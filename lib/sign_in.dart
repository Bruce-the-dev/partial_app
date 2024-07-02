import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInScreen extends StatelessWidget {
  // Example sign-in method
  Future<void> signInWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Navigate to HomeScreen after successful sign-in
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      print('Failed to sign in: $e');
      // Handle sign-in errors as needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            signInWithEmailAndPassword(
                context, 'test@example.com', 'password123');
          },
          child: Text('Sign In'),
        ),
      ),
    );
  }
}
