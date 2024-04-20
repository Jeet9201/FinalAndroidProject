import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newnew/Class/auth.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);

  Future<void> signOut(BuildContext context) async {
    await Auth().signOut();
    Navigator.pop(context); // Go back to previous screen after signing out
  }

  Widget _title() {
    return const Text('Firebase Auth');
  }

  Widget _userEmail(User? user) {
    return Text(user?.email ?? 'Not signed in');
  }

  Widget _signOutButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () => signOut(context),
      child: const Text('Sign out'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<User?>(
              stream: Auth().authStateChanges,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); // Show loading indicator while checking authentication state
                } else {
                  User? user = snapshot.data;
                  return _userEmail(user);
                }
              },
            ),
            SizedBox(height: 20),
            _signOutButton(context),
          ],
        ),
      ),
    );
  }
}
