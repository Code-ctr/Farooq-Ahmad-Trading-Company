// lib/models/simple_entity.dart
import 'package:objectbox/objectbox.dart';

@Entity()
class SimpleEntity {
  int id = 0;
  String name;

  SimpleEntity({this.id = 0, required this.name});
}
