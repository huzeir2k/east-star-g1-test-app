import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7E8A4), // Gold-ish background color
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image at the top
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon(
                Icons.traffic,
                size: 150,
                color: Colors.green,
              ),
            ),

            // "Sign in or register below:" label
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Sign in or register below:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),

            // "Sign in with..." button
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to Sign In page
                  Navigator.pushNamed(context, '/signin');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Green button
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Sign in with...',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),

            // "- or -" label
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                '- or -',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ),

            // "Register" button
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to Register page
                  Navigator.pushNamed(context, '/register');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Red button
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Register',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),

            // Spacer
            Spacer(),

            // Copyright label
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Copyright (C) 2025, East Star Driving School. All rights reserved',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
