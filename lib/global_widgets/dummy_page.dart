import 'package:flutter/material.dart';

class DummyPage extends StatelessWidget {
  const DummyPage({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(label),
      ),
    );
  }
}
