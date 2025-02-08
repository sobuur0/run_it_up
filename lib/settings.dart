import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(
          'Settings',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
              trailing: Icon(Icons.arrow_forward),
            ),
            const ListTile(
              leading: Icon(Icons.color_lens),
              title: Text('Theme'),
              trailing: Icon(Icons.arrow_forward),
            ),
            const ListTile(
              leading: Icon(Icons.lock),
              title: Text('Privacy & Security'),
              trailing: Icon(Icons.arrow_forward),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text(
                'Logout',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                // Add logout logic here
              },
            ),
          ],
        ),
      ),
    );
  }
}
