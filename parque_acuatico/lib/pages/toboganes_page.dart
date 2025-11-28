import 'package:flutter/material.dart';

class ToboganesPage extends StatelessWidget {
  const ToboganesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toboganes'),
      ),
      body: const Center(
        child: Text('Próximamente'),
      ),
    );
  }
}
