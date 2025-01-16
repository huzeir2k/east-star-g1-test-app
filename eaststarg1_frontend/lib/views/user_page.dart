import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/user_controller.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userController = Provider.of<UserController>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Users')),
      body: userController.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: userController.users.length,
              itemBuilder: (context, index) {
                final user = userController.users[index];
                return ListTile(
                  title: Text(user['name']),
                  subtitle: Text(user['email']),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          userController.addUser('New User', 'newuser@example.com');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
