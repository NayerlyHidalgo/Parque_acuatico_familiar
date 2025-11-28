import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parque Acuático'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.go('/boletos'),
              child: const Text('Boletos'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => context.go('/comida'),
              child: const Text('Comida'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => context.go('/toboganes'),
              child: const Text('Toboganes'),
            ),
          ],
        ),
      ),
    );
  }
}
