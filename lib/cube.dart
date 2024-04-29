import 'package:flutter/material.dart';

class CubePage extends StatefulWidget {
  const CubePage({super.key});

  @override
  State<CubePage> createState() => _CubePageState();
}

class _CubePageState extends State<CubePage> {
  String _lengthText = '';
  String _volumeText = '';
  String _perimeterText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cube'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onChanged: (value) {
                  setState(() {
                    _lengthText = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Length',
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  try {
                    final length = int.parse(_lengthText);
                    if (length > 0) {
                      final volume = length * length * length;
                      final perimeter = 12 * length;
                      setState(() {
                        _volumeText = 'Volume: ${volume.toStringAsFixed(2)} units^3';
                        _perimeterText = 'Perimeter: ${perimeter.toStringAsFixed(2)} units';
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Length must be a positive integer')),
                      );
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Invalid input')),
                    );
                  }
                },
                child: const Text('Calculate'),
              ),
              const SizedBox(height: 16.0),
              Text(_volumeText),
              const SizedBox(height: 8.0),
              Text(_perimeterText),
            ],
          ),
        ),
      ),
    );
  }
}
