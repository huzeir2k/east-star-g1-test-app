import 'package:flutter/material.dart';
import './views/login_screen.dart'; // Import the login screen
import './views/signin_screen.dart';
import './views/register_page.dart';
import './views/manual_signin_screen.dart';
import './views/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Disable the debug banner
      title: 'East Star Driving School',
      theme: ThemeData(
        primarySwatch: Colors.green, // Optional: Set a theme color
      ),
      home: LoginScreen(), // Set LoginScreen as the first screen
      routes: {
        '/signin': (context) => SignInPage(),
        '/register': (context) => RegistrationForm(),
        '/manual_signin': (context) => const ManualSignInScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
