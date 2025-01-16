import 'package:flutter/material.dart';
import './views/login_screen.dart'; // Import the login screen
import './views/signin_screen.dart';

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
        '/signin': (context) =>
            SignInPage(), // Define the route for the sign-in page
      },
    );
  }
}
