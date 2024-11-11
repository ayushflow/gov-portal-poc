import 'package:flutter/material.dart';

class FormsPage extends StatefulWidget {
  const FormsPage({super.key, required this.id});

  final String id;

  @override
  State<FormsPage> createState() => _FormsPageState();
}

class _FormsPageState extends State<FormsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form ${widget.id}'),
      ),
      body: Text('Showing :${widget.id} form'),
    );
  }
}
