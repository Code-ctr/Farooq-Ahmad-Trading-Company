// lib/services/database_service.dart
import 'package:path_provider/path_provider.dart';
import '../models/users_entity.dart';
import '../objectbox.g.dart';

class DatabaseService {
  static late Store _store;
  static bool _initialized = false;
  static String? _errorMessage;

  static bool get isInitialized => _initialized;
  static String? get errorMessage => _errorMessage;

  static Future<bool> initialize() async {
    try {
      if (_initialized) return true;

      final docsDir = await getApplicationDocumentsDirectory();
      final dbPath = '${docsDir.path}/farooqtrading_db';

      print('📁 Database path: $dbPath');

      _store = await openStore(directory: dbPath, maxDBSizeInKB: 100000);

      _initialized = true;
      _errorMessage = null;
      print('✅ ObjectBox database initialized successfully');

      // Initialize default data
      await initializeDefaultData();

      return true;
    } catch (e) {
      _initialized = false;
      _errorMessage = 'Database initialization failed: $e';
      print('❌ Database error: $_errorMessage');

      return false;
    }
  }

  static Store get store {
    if (!_initialized) {
      throw Exception('Database not initialized. Call initialize() first.');
    }
    return _store;
  }

  static void close() {
    if (_initialized) {
      _store.close();
      _initialized = false;
      print('🔒 Database closed');
    }
  }

  static Future<void> initializeDefaultData() async {
    try {
      // Initialize default user directly here
      final userBox = Box<UserEntity>(_store);
      final existingUser = userBox.query().build().findFirst();

      if (existingUser == null) {
        final defaultUser = UserEntity.createUser('FarooqAhmad', 'farooq123');
        userBox.put(defaultUser);
        print('✅ Default user created: FarooqAhmad');
      }
    } catch (e) {
      print('❌ Error initializing default data: $e');
    }
  }
}
