import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart'; // Add this if you use Google sign-in
import 'package:sign_in_with_apple/sign_in_with_apple.dart'; // Add this for Apple sign-in

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Screen',
      theme: ThemeData(
        primaryColor: const Color(0xFFF45A58),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFF45A58),
          primary: const Color(0xFFF45A58),
          secondary: const Color(0xFFFBDE63),
          tertiary: const Color(0xFF83C55D),
        ),
      ),
      home: const LoginScreen(), // This sets the login screen as the home screen
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Google sign-in instance
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> _handleGoogleSignIn() async {
    try {
      await _googleSignIn.signIn();
      // Handle successful sign-in
    } catch (error) {
      // Handle error
      print(error);
    }
  }

  Future<void> _handleAppleSignIn() async {
    try {
      final result = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      // Handle successful sign-in with Apple
    } catch (error) {
      // Handle error
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF), // Background color #FFFFFF
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Logo or app title
              Text(
                'Welcome!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary, // Accent color #F45A58
                ),
              ),
              const SizedBox(height: 40),

              // Login with Email
              ElevatedButton(
                onPressed: () {
                  // Handle email login
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary, // Primary color
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Login with Email'),
              ),
              const SizedBox(height: 16),

              // Google Sign-In Button
              ElevatedButton.icon(
                onPressed: _handleGoogleSignIn,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary, // Secondary color #FBDE63
                  minimumSize: const Size(double.infinity, 50),
                ),
                icon: const Icon(Icons.g_mobiledata),
                label: const Text('Login with Google'),
              ),
              const SizedBox(height: 16),

              // Apple Sign-In Button
              ElevatedButton.icon(
                onPressed: _handleAppleSignIn,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Standard for Apple login
                  minimumSize: const Size(double.infinity, 50),
                ),
                icon: const Icon(Icons.apple),
                label: const Text(
                  'Login with Apple',
                  style: TextStyle(color: Colors.white), // White text for contrast
                ),
              ),
              const SizedBox(height: 40),

              // Sign up or Forgot password
              TextButton(
                onPressed: () {
                  // Handle "Sign up" or "Forgot Password" navigation
                },
                child: Text(
                  'Sign up or Forgot Password?',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.tertiary, // Tertiary color #83C55D
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


