import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/user_controller.dart';
import 'views/user_list_view.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserController()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserPage(),
    );
  }
}

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userController = Provider.of<UserController>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Users')),
      body: userController.isLoading
          ? Center(child: CircularProgressIndicator())
          : UserListView(users: userController.users),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          userController.fetchUsers();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
