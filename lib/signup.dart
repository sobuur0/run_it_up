import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(
          'Sign Up',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Create your account',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 80),
            const Text('Full Name'),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Enter your full name',
              ),
            ),
            const SizedBox(height: 20),
            const Text('Email'),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Enter your email',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            const Text('Username'),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Enter your username',
              ),
            ),
            const SizedBox(height: 20),
            const Text('Password'),
            TextField(
              obscureText: _obscureText,
              decoration: InputDecoration(
                hintText: 'Enter your password',
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: _togglePasswordVisibility,
                ),
              ),
            ),
            const SizedBox(height: 70),
            ElevatedButton(
              onPressed: null,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Theme.of(context).colorScheme.primary,
                disabledBackgroundColor:
                    Theme.of(context).colorScheme.primary.withOpacity(0.1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 50),
            Text.rich(
              TextSpan(
                text: 'Already have an account? ',
                children: [
                  TextSpan(
                    text: 'Login',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        GoRouter.of(context).push('/login');
                      },
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
