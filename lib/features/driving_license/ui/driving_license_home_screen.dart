import 'package:flutter/material.dart';

class DrivingLicenseHomeScreen extends StatelessWidget {
  const DrivingLicenseHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Driving License Services'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildActionButton(
              context,
              'Apply for Driving License',
              Icons.add,
              () {
                // TODO: Implement apply functionality
              },
            ),
            const SizedBox(height: 16),
            _buildActionButton(
              context,
              'Track Application',
              Icons.track_changes,
              () {
                // TODO: Implement track functionality
              },
            ),
            const SizedBox(height: 16),
            _buildActionButton(
              context,
              'Download License',
              Icons.download,
              () {
                // TODO: Implement download functionality
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onPressed,
  ) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
