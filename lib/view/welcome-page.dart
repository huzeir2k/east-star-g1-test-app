import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'home-page.dart'; // Replace with your actual HomePage import
import 'register-page.dart'; // Replace with your actual RegisterPage import

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Screen',
      theme: _buildTheme(),
      home: const LoginScreen(),
    );
  }

  ThemeData _buildTheme() {
    const primaryColor = Color(0xFFF45A58);
    return ThemeData(
      primaryColor: primaryColor,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        primary: primaryColor,
        secondary: const Color(0xFFFBDE63),
        tertiary: Color.fromARGB(255, 53, 83, 36),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> _handleGoogleSignIn() async {
    try {
      final account = await _googleSignIn.signIn();
      if (account != null) {
        _navigateToHomePage();
      }
    } catch (error) {
      print('Google Sign-In error: $error');
      _showErrorDialog('Google Sign-In failed. Please try again.');
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
      if (result != null) {
        _navigateToHomePage();
      }
    } catch (error) {
      print('Apple Sign-In error: $error');
      _showErrorDialog('Apple Sign-In failed. Please try again.');
    }
  }

  void _navigateToHomePage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  void _navigateToRegisterPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const RegisterPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildHeader(),
              const SizedBox(height: 40),
              _buildLoginWithEmailButton(),
              const SizedBox(height: 16),
              _buildGoogleSignInButton(),
              const SizedBox(height: 16),
              _buildAppleSignInButton(),
              const SizedBox(height: 40),
              _buildSignUpForgotPassword(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Text(
      'Welcome!',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  Widget _buildLoginWithEmailButton() {
    return ElevatedButton(
      onPressed: () {
        // Handle email login
        _navigateToRegisterPage(); // Example fallback for email login
      },
      style: _buttonStyle(Theme.of(context).colorScheme.primary),
      child: const Text('Login with Email'),
    );
  }

  Widget _buildGoogleSignInButton() {
    return ElevatedButton.icon(
      onPressed: _handleGoogleSignIn,
      style: _buttonStyle(Theme.of(context).colorScheme.secondary),
      icon: const Icon(Icons.g_mobiledata, color: Colors.redAccent),
      label: const Text(
        'Login with Google',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 43, 90, 45),
        ),
      ),
    );
  }

  Widget _buildAppleSignInButton() {
    return ElevatedButton.icon(
      onPressed: _handleAppleSignIn,
      style: _buttonStyle(Colors.black),
      icon: const Icon(Icons.apple),
      label: const Text(
        'Login with Apple',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildSignUpForgotPassword() {
    return TextButton(
      onPressed: _navigateToRegisterPage,
      child: Text(
        'Sign up or Forgot Password?',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Theme.of(context).colorScheme.tertiary,
        ),
      ),
    );
  }

  ButtonStyle _buttonStyle(Color backgroundColor) {
    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      minimumSize: const Size(double.infinity, 50),
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
