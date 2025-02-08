import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:run_it_up/homescreen.dart';
import 'package:run_it_up/login.dart';
import 'package:run_it_up/profile.dart';
import 'package:run_it_up/settings.dart';
import 'package:run_it_up/signup.dart';
import 'package:run_it_up/splashscreen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const Splashscreen();
      },
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) {
        return const SignupScreen();
      },
    ),
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Settings'),
            ],
            currentIndex: _calculateSelectedIndex(state),
            onTap: (index) => _onItemTapped(index, context),
          ),
        );
      },
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfileScreen(),
        ),
        GoRoute(
          path: '/settings',
          builder: (context, state) => const SettingsScreen(),
        ),
      ],
    ),
  ],
  debugLogDiagnostics: true,
);

int _calculateSelectedIndex(GoRouterState state) {
  final String location = state.matchedLocation;
  if (location.startsWith('/home')) return 0;
  if (location.startsWith('/profile')) return 1;
  if (location.startsWith('/settings')) return 2;
  return 0;
}

void _onItemTapped(int index, BuildContext context) {
  switch (index) {
    case 0:
      context.go('/home');
      break;
    case 1:
      context.go('/profile');
      break;
    case 2:
      context.go('/settings');
      break;
  }
}
