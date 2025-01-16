import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7E8A4), // Gold-ish background color
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back button
            IconButton(
              icon: Icon(Icons.arrow_back, size: 24, color: Colors.black),
              onPressed: () {
                Navigator.pop(context); // Go back to the previous page
              },
            ),

            // "Sign in with..." label
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
              child: Text(
                'Sign in with...',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),

            // Buttons for Google, Outlook, Yahoo, Apple
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildSignInButton(
                      context,
                      label: 'Google',
                      color: Colors.red,
                      icon: Icons.mail,
                    ),
                    SizedBox(height: 16.0),
                    _buildSignInButton(
                      context,
                      label: 'Outlook',
                      color: Colors.blue,
                      icon: Icons.email,
                    ),
                    SizedBox(height: 16.0),
                    _buildSignInButton(
                      context,
                      label: 'Yahoo',
                      color: Colors.purple,
                      icon: Icons.email_outlined,
                    ),
                    SizedBox(height: 16.0),
                    _buildSignInButton(
                      context,
                      label: 'Apple',
                      color: Colors.black,
                      icon: Icons.apple,
                    ),
                  ],
                ),
              ),
            ),

            // "Sign in manually" button
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to manual sign-in page
                  Navigator.pushNamed(context, '/manual_signin');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Green button
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Sign in manually',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build a sign-in button
  Widget _buildSignInButton(BuildContext context,
      {required String label, required Color color, required IconData icon}) {
    return ElevatedButton.icon(
      onPressed: () {
        // Implement sign-in logic for the respective provider
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Sign in with $label is not yet implemented.')),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color, // Button background color
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      icon: Icon(icon, color: Colors.white),
      label: Text(
        'Sign in with $label',
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
