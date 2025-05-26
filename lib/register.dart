import 'package:flutter/material.dart';
import 'home.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void _showMsg(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  void _handleRegister() {
    if (_formKey.currentState!.validate()) {
      _showMsg("Registration Successful!");

      Future.delayed(Duration(milliseconds: 500), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      });

      _emailController.clear();
      _passController.clear();
      _confirmPassController.clear();
    }
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Email is required';
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) return 'Enter a valid email';
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Password is required';
    if (value.length < 6) return 'Password must be at least 6 characters';
    
    // for pass
    final passRegex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$');
    if (!passRegex.hasMatch(value)) {
      return 'Include uppercase, lowercase, and number';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value != _passController.text) return 'Passwords do not match';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back btn
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 20),
                  child: Container(
                    height: 47,
                    width: 47,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1.5),
                    ),
                    child: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
                  ),
                ),

                // Logo
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Container(
                      height: 110,
                      width: 110,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(360),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(20),
                        child: Image(image: AssetImage('assets/images/logo.png')),
                      ),
                    ),
                  ),
                ),

                // Header
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 25),
                  child: Text(
                    'Register',
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Ubuntu',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 28),
                  child: Text(
                    'Create your MedEase account',
                    style: const TextStyle(
                      fontSize: 17,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Ubuntu',
                    ),
                  ),
                ),

                // Email
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 30, right: 30),
                  child: TextFormField(
                    controller: _emailController,
                    validator: _validateEmail,
                    style: const TextStyle(
                      fontFamily: 'Ubuntu', 
                      fontSize: 15
                      ),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      label: const Text('Enter your Email ID'),
                      prefixIcon: const Icon(Icons.alternate_email_rounded),
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(width: 3)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(360),
                          borderSide: const BorderSide(width: 3)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(360),
                          borderSide: const BorderSide(width: 3)),
                    ),
                  ),
                ),

                // Password
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
                  child: TextFormField(
                    controller: _passController,
                    validator: _validatePassword,
                    style: const TextStyle(
                      fontFamily: 'Ubuntu', 
                      fontSize: 15
                      ),
                    obscureText: true,
                    obscuringCharacter: '.',
                    decoration: InputDecoration(
                      label: const Text('Enter Password'),
                      prefixIcon: const Icon(Icons.password_rounded),
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(width: 3)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(360),
                          borderSide: const BorderSide(width: 3)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(360),
                          borderSide: const BorderSide(width: 3)),
                    ),
                  ),
                ),

                // Confirm Password
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
                  child: TextFormField(
                    controller: _confirmPassController,
                    validator: _validateConfirmPassword,
                    style: const TextStyle(fontFamily: 'Ubuntu', fontSize: 15),
                    obscureText: true,
                    obscuringCharacter: '.',
                    decoration: InputDecoration(
                      label: const Text('Confirm Password'),
                      prefixIcon: const Icon(Icons.password_rounded),
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(width: 3)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(360),
                          borderSide: const BorderSide(width: 3)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(360),
                          borderSide: const BorderSide(width: 3)),
                    ),
                  ),
                ),

                // Register Button
                const SizedBox(height: 30),
                Center(
                  child: ElevatedButton(
                    onPressed: _handleRegister,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(360),
                      ),
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
