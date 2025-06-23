import 'package:flutter/material.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (!_validateName()) {
      _nameController.text = 'Please enter your name';
    }
    if (!_validateEmail()) {
      _emailController.text = 'Please enter a valid email';
    }
    if (!_validatePassword()) {
      _passwordController.text = 'Password must be at least 6 characters';
    }
    if (_allValid()) {
      _nameController.text = 'Registration successful!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width : 400,
      height : 300, 
      padding : const EdgeInsets.all(16),
      margin : const EdgeInsets.symmetric(vertical : 8),
      decoration : const BoxDecoration (
        color : Colors.redAccent,
      ),
      child : Form (
        key : _formKey,
        child : Column (
          children : [
            TextFormField (
              key : const Key('name'),
              controller : _nameController,
              decoration : const InputDecoration(labelText : "name"),
            ),
            const SizedBox(height : 8),

            TextFormField(
              key : const Key('email'),
              controller : _emailController,
              decoration : const InputDecoration(labelText : "email"),
            ),
            const SizedBox(height : 8),

            TextFormField(
              key : const Key('password'),
              controller : _passwordController,
              decoration : const InputDecoration(labelText : "password"),
            ),
            const SizedBox(height : 8),

            ElevatedButton(
              onPressed: _submitForm,
              style : ElevatedButton.styleFrom(
                backgroundColor : Colors.red,
                foregroundColor : Colors.white,
              ),
              child: const Text (
                "Submit",
                style : TextStyle (
                  color : Colors.white,
                  fontSize : 24
                )
              ),
            )
          ]
        )
      )
    );
  }

  bool _validateName() {
    String name = _nameController.text;
    if (name != "") {
      return true;
    }
    return false;
  }

  bool _validateEmail() {
    String email = _emailController.text;
    if (email.contains("@")) {
      return true;
    }
    return false;
  }

  bool _validatePassword() {
    String pw = _passwordController.text;
    if (pw.length >= 6) {
      return true;
    }
    return false;
  }

  bool _allValid() {
    return (_validateName() && _validateEmail() && _validatePassword());
  }
}
