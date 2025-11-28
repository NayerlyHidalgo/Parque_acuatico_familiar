import 'package:flutter/material.dart';

class ComidaPage extends StatefulWidget {
  const ComidaPage({super.key});

  @override
  State<ComidaPage> createState() => _ComidaPageState();
}

class _ComidaPageState extends State<ComidaPage> {
  final _comboInfantilController = TextEditingController();
  final _comboAdultoController = TextEditingController();
  String _resultado = '';

  final double _precioComboInfantil = 80.0;
  final double _precioComboAdulto = 120.0;

  void _calcularGasto() {
    int combosInfantiles = int.tryParse(_comboInfantilController.text) ?? 0;
    int combosAdultos = int.tryParse(_comboAdultoController.text) ?? 0;

    double total = (combosInfantiles * _precioComboInfantil) + (combosAdultos * _precioComboAdulto);

    setState(() {
      _resultado = 'Total en comida: \$${total.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comida'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _comboInfantilController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Combo infantil (\$80)',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _comboAdultoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Combo adulto (\$120)',
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: _calcularGasto,
              child: const Text('Calcular'),
            ),
            const SizedBox(height: 15),
            if (_resultado.isNotEmpty)
              Text(
                _resultado,
                style: const TextStyle(fontSize: 14),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _comboInfantilController.dispose();
    _comboAdultoController.dispose();
    super.dispose();
  }
}
