import 'package:flutter/material.dart';
import '../services/user_service.dart';

class UserController extends ChangeNotifier {
  final UserService _userService = UserService();
  List<Map<String, dynamic>> _users = [];
  bool _isLoading = false;

  List<Map<String, dynamic>> get users => _users;
  bool get isLoading => _isLoading;

  Future<void> fetchUsers() async {
    _isLoading = true;
    notifyListeners();

    // try {
    //   _users = await _userService.fetchUsers();
    // } catch (e) {
    //   // Handle error
    // } finally {
    //   _isLoading = false;
    //   notifyListeners();
    // }
  }

  Future<void> addUser(String name, String email) async {
    try {
      await _userService.addUser(name, email);
      await fetchUsers(); // Refresh data
    } catch (e) {
      // Handle error
    }
  }
}
