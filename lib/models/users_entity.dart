// lib/models/user_entity.dart
import 'package:objectbox/objectbox.dart';

@Entity()
class UserEntity {
  int id = 0;
  String username;
  String hashedPassword;
  String salt;
  int createdAt; // Store as int (timestamp)
  int lastLogin; // Store as int (timestamp)
  bool isActive;

  UserEntity({
    this.id = 0,
    required this.username,
    required this.hashedPassword,
    required this.salt,
    int? createdAt,
    int? lastLogin,
    this.isActive = true,
  }) : createdAt = createdAt ?? DateTime.now().millisecondsSinceEpoch,
       lastLogin = lastLogin ?? DateTime.now().millisecondsSinceEpoch;

  // Helper getters to convert to DateTime
  DateTime get createdAtDate => DateTime.fromMillisecondsSinceEpoch(createdAt);
  DateTime get lastLoginDate => DateTime.fromMillisecondsSinceEpoch(lastLogin);

  bool verifyPassword(String inputPassword) {
    final inputHash = _hashPassword(inputPassword, salt);
    return inputHash == hashedPassword;
  }

  static UserEntity createUser(String username, String plainPassword) {
    final salt = DateTime.now().microsecondsSinceEpoch.toString();
    final hashedPassword = _hashPassword(plainPassword, salt);

    return UserEntity(
      username: username,
      hashedPassword: hashedPassword,
      salt: salt,
    );
  }

  static String _hashPassword(String password, String salt) {
    return (password + salt).hashCode.toString();
  }
}
