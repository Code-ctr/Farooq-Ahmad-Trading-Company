// lib/main.dart
import 'package:farooqtrading/DataBase/database_error_widget.dart';
import 'package:farooqtrading/DataBase/database_services.dart';
import 'package:farooqtrading/device_config.dart';
import 'package:farooqtrading/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoading = true;
  bool _databaseInitialized = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    try {
      final success = await DatabaseService.initialize();

      setState(() {
        _databaseInitialized = success;
        _errorMessage = DatabaseService.errorMessage;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _databaseInitialized = false;
        _errorMessage = 'Unexpected error: $e';
        _isLoading = false;
      });
    }
  }

  void _retryInitialization() {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    _initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return MaterialApp(
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 20),
                const Text('Initializing Database...'),
                if (_errorMessage != null) ...[
                  const SizedBox(height: 10),
                  Text(
                    'Error: $_errorMessage',
                    style: const TextStyle(color: Colors.red),
                  ),
                ],
              ],
            ),
          ),
        ),
      );
    }

    if (!_databaseInitialized) {
      return DatabaseErrorWidget(
        errorMessage: _errorMessage ?? 'Unknown database error',
        onRetry: _retryInitialization,
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) {
          DeviceConfig.init(context);
          return LoginPage();
        },
      ),
    );
  }

  @override
  void dispose() {
    DatabaseService.close();
    super.dispose();
  }
}
