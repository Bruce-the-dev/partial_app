import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatelessWidget {
  // Example sign-up method
  Future<void> signUpWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Navigate to SignInScreen after successful sign-up
      Navigator.pushReplacementNamed(context, '/signIn');
    } catch (e) {
      print('Failed to sign up: $e');
      // Handle sign-up errors as needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            signUpWithEmailAndPassword(
                context, 'test@example.com', 'password123');
          },
          child: Text('Sign Up'),
        ),
      ),
    );
  }
}
