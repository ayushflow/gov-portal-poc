import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        elevation: 0,
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: [
          _buildDashboardItem(
            icon: Icons.person,
            title: 'Profile',
            onTap: () {},
          ),
          _buildDashboardItem(
            icon: Icons.notifications,
            title: 'Notifications',
            onTap: () {},
          ),
          _buildDashboardItem(
            icon: Icons.file_copy,
            title: 'Documents',
            onTap: () {},
          ),
          _buildDashboardItem(
            icon: Icons.settings,
            title: 'Settings',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
