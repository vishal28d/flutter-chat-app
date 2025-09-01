import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final User? user;

  const AppDrawer({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              user?.displayName ?? "We Chat User",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            accountEmail: Text(user?.email ?? "No email"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.green.shade700,
              child: Text(
                user?.email?.substring(0, 1).toUpperCase() ?? "W",
                style: const TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.green.shade600,
            ),
          ),

          // Settings
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.black87),
            title: const Text("Settings"),
            onTap: () {
              Navigator.pop(context);
              // Push settings page (create later)
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Settings page coming soon...")),
              );
            },
          ),

          // Contact creator
          ListTile(
            leading: const Icon(Icons.contact_mail, color: Colors.black87),
            title: const Text("Contact Creator"),
            onTap: () {
              Navigator.pop(context);
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Contact Creator"),
                  content: const Text(
                      "For queries, contact Vishal Maurya\nEmail: vishalmaurya@gmail.com"),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("OK"),
                    )
                  ],
                ),
              );
            },
          ),

          const Divider(),

          // About
          ListTile(
            leading: const Icon(Icons.info_outline, color: Colors.black87),
            title: const Text("About"),
            onTap: () {
              Navigator.pop(context);
              showAboutDialog(
                context: context,
                applicationName: "We Chat",
                applicationVersion: "1.0.0",
                applicationLegalese: "Created by Vishal Maurya",
              );
            },
          ),
        ],
      ),
    );
  }
}
