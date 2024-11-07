import 'package:flutter/material.dart';

class ContinueJourneyPage extends StatefulWidget {
  const ContinueJourneyPage({super.key});

  @override
  State<ContinueJourneyPage> createState() => _ContinueJourneyPageState();
}

class _ContinueJourneyPageState extends State<ContinueJourneyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Continue Journey Page')),
    );
  }
}
