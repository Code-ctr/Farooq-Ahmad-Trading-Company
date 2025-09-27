// lib/services/auth_service.dart
import 'package:farooqtrading/DataBase/database_services.dart';
import 'package:farooqtrading/models/users_entity.dart';
import 'package:objectbox/objectbox.dart';

class AuthService {
  static AuthResult login(String username, String password) {
    try {
      if (username.isEmpty || password.isEmpty) {
        return AuthResult(
          success: false,
          message: 'Please enter both username and password',
        );
      }

      // Get user from database
      final userBox = Box<UserEntity>(DatabaseService.store);
      final users = userBox.getAll();

      UserEntity? user;
      for (final u in users) {
        if (u.username == username) {
          user = u;
          break;
        }
      }

      if (user == null) {
        return AuthResult(
          success: false,
          message: 'Invalid username or password',
        );
      }

      if (user.verifyPassword(password)) {
        // Update last login
        user.lastLogin = DateTime.now().millisecondsSinceEpoch;
        userBox.put(user);

        return AuthResult(
          success: true,
          message: 'Login successful! Welcome to Farooq Trading.',
        );
      } else {
        return AuthResult(
          success: false,
          message: 'Invalid username or password',
        );
      }
    } catch (e) {
      return AuthResult(
        success: false,
        message: 'System error: ${e.toString()}',
      );
    }
  }
}

class AuthResult {
  final bool success;
  final String message;

  const AuthResult({required this.success, required this.message});
}
