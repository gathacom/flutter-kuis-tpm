import 'package:flutter/material.dart';

class TrapezoidPage extends StatefulWidget {
  const TrapezoidPage({super.key});

  @override
  State<TrapezoidPage> createState() => _TrapezoidPageState();
}

class _TrapezoidPageState extends State<TrapezoidPage> {
  double? _a;
  double? _b;
  double? _c;
  double? _d;
  double? _h;

  String _perimeterText = '';
  String _areaText = '';

  void _calculate() {
    final perimeter = _a! + _b! + _c! + _d!;
    final area = ((_a! + _b!) / 2) * _h!;
    setState(() {
      _perimeterText = 'Perimeter: $perimeter';
      _areaText = 'Area: ${area.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trapezoid'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Length of first parallel side (a)'),
              onChanged: (value) {
                _a = double.tryParse(value);
              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Length of second parallel side (b)'),
              onChanged: (value) {
                _b = double.tryParse(value);
              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Length of first non-parallel side (c)'),
              onChanged: (value) {
                _c = double.tryParse(value);
              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Length of second non-parallel side (d)'),
              onChanged: (value) {
                _d = double.tryParse(value);
              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Height (h)'),
              onChanged: (value) {
                _h = double.tryParse(value);
              },
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _calculate,
              child: const Text('Count Perimeter & Area'),
            ),
            const SizedBox(height: 24),
            Text(_perimeterText),
            const SizedBox(height: 24),
            Text(_areaText),
          ],
        ),
      ),
    );
  }
}
