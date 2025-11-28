import 'package:flutter/material.dart';

class BoletosPage extends StatefulWidget {
  const BoletosPage({super.key});

  @override
  State<BoletosPage> createState() => _BoletosPageState();
}

class _BoletosPageState extends State<BoletosPage> {
  final _ninosController = TextEditingController();
  final _adultosController = TextEditingController();
  String _diaSemana = 'Entre semana';
  String _resultado = '';

  final double _precioNino = 50.0;
  final double _precioAdulto = 100.0;

  void _calcularTotal() {
    int ninos = int.tryParse(_ninosController.text) ?? 0;
    int adultos = int.tryParse(_adultosController.text) ?? 0;

    double subtotal = (ninos * _precioNino) + (adultos * _precioAdulto);
    double descuento = 0;
    bool aplicaDescuento = _diaSemana == 'Entre semana';

    if (aplicaDescuento) {
      descuento = subtotal * 0.10;
    }

    double total = subtotal - descuento;

    setState(() {
      _resultado = 'Subtotal: \$${subtotal.toStringAsFixed(2)}\n';
      if (aplicaDescuento) {
        _resultado += 'Descuento (10%): -\$${descuento.toStringAsFixed(2)}\n';
      } else {
        _resultado += 'No se aplicó descuento\n';
      }
      _resultado += 'Total a pagar: \$${total.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Boletos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _ninosController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Niños',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _adultosController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Adultos',
              ),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _diaSemana,
              decoration: const InputDecoration(
                labelText: 'Día',
              ),
              items: const [
                DropdownMenuItem(value: 'Entre semana', child: Text('Entre semana')),
                DropdownMenuItem(value: 'Fin de semana', child: Text('Fin de semana')),
              ],
              onChanged: (value) {
                setState(() {
                  _diaSemana = value!;
                });
              },
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: _calcularTotal,
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
    _ninosController.dispose();
    _adultosController.dispose();
    super.dispose();
  }
}
