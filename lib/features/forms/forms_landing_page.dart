import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gov_driving_license_portal/component/widgets/continue_journey_cta/continue_journey_cta_widget.dart';

class FormsLandingPage extends StatefulWidget {
  const FormsLandingPage({super.key});

  @override
  State<FormsLandingPage> createState() => _FormsLandingPageState();
}

class _FormsLandingPageState extends State<FormsLandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Current forms'),
      ),
      body: Wrap(
        direction: Axis.horizontal,
        children: List.generate(
            16,
            (index) => ElevatedButton(
                onPressed: () {
                  context.go('/forms/form/${index + 1}');
                },
                child: Text('Form ${index + 1}'))),
      ),
    );
  }
}
