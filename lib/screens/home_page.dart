import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'semester_page.dart';
import 'login_page.dart';
import 'admin_login_page.dart'; // ✅ Goes to admin login, not admin page directly

class HomePage extends StatelessWidget {
  final List<String> years = [
    "1st Year",
    "2nd Year",
    "3rd Year",
    "4th Year",
  ];

  Future<void> logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("token");
    await prefs.remove("admin_token"); // also clear admin token if any
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BTech Resources"),
        actions: [
          // ✅ Admin button now goes to AdminLoginPage first
          IconButton(
            icon: const Icon(Icons.admin_panel_settings),
            tooltip: "Admin Login",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AdminLoginPage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: "Logout",
            onPressed: () => logout(context),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: years.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Text("${index + 1}"),
              ),
              title: Text(
                years[index],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SemesterPage(year: years[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}