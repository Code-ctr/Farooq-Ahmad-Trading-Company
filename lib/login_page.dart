// Updated LoginPage with secure authentication
import 'package:farooqtrading/Components/appcolor.dart';
import 'package:farooqtrading/Components/dashborad.dart';
import 'package:farooqtrading/Components/mybutton.dart';
import 'package:farooqtrading/Components/mytextfield.dart';
import 'package:farooqtrading/DataBase/auth.dart';
import 'package:farooqtrading/device_config.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController name = TextEditingController();
  final TextEditingController passwd = TextEditingController();

  String _usernameError = '';
  String _passwordError = '';
  bool _isLoading = false;

  @override
  void dispose() {
    name.dispose();
    passwd.dispose();
    super.dispose();
  }

  void _validateAndLogin() async {
    // Reset errors
    setState(() {
      _usernameError = '';
      _passwordError = '';
      _isLoading = true;
    });

    final username = name.text.trim();
    final password = passwd.text.trim();

    // Basic validation
    if (username.isEmpty) {
      setState(() {
        _usernameError = 'Username is required';
        _isLoading = false;
      });
      return;
    }

    if (password.isEmpty) {
      setState(() {
        _passwordError = 'Password is required';
        _isLoading = false;
      });
      return;
    }

    // Perform authentication
    final result = AuthService.login(username, password);

    setState(() {
      _isLoading = false;
    });

    if (result.success) {
      // Login successful
      _showSuccessDialog();

      // Navigate to dashboard after success message
      Future.delayed(const Duration(milliseconds: 1500), () {
        Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => Dashboard()),
        );
      });
    } else {
      // Login failed
      _showErrorDialog(result.message);
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Login Failed'),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (context) => Dialog(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.check_circle, size: 60, color: Colors.green),
                  const SizedBox(height: 15),
                  const Text(
                    'Login Successful!',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text('Welcome to Farooq Trading'),
                  const SizedBox(height: 20),
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                  ),
                ],
              ),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double fieldWidth;
    double buttonWidth;

    if (DeviceConfig.isMobile) {
      fieldWidth = MediaQuery.of(context).size.width * 0.95;
      buttonWidth = MediaQuery.of(context).size.width * 0.4;
    } else {
      fieldWidth = MediaQuery.of(context).size.width * 0.35;
      buttonWidth = MediaQuery.of(context).size.width * 0.1;
    }

    return Scaffold(
      backgroundColor: AppColor.background,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App Logo/Title
              const Column(
                children: [
                  Icon(Icons.security, size: 80, color: Colors.green),
                  SizedBox(height: 10),
                  Text(
                    'Farooq Trading',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Secure Login',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // Username Field
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Mytextfield(
                    controller: name,
                    hinttext: "Username",
                    width: fieldWidth,
                    //errorText: _usernameError.isNotEmpty ? _usernameError : null,
                  ),
                  if (_usernameError.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 5),
                      child: Text(
                        _usernameError,
                        style: const TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ),
                ],
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.01),

              // Password Field
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Mytextfield(
                    controller: passwd,
                    hinttext: "Password",
                    width: fieldWidth,
                    //obscureText: true,
                    //errorText: _passwordError.isNotEmpty ? _passwordError : null,
                  ),
                  if (_passwordError.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 5),
                      child: Text(
                        _passwordError,
                        style: const TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ),
                ],
              ),

              const SizedBox(height: 30),

              // Login Button
              _isLoading
                  ? CircularProgressIndicator()
                  : Mybutton(
                    onTap: _validateAndLogin,
                    text: "Log in",
                    color: Colors.white,
                    buttoncolor: Colors.green,
                    width: buttonWidth,
                    enableHover: true,
                  ),

              const SizedBox(height: 20),

              // Security Info
              Card(
                color: Colors.green[50],
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Icon(Icons.verified_user, size: 30, color: Colors.green),
                      SizedBox(height: 5),
                      Text(
                        'Secure Authentication',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Credentials are securely stored and encrypted',
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
