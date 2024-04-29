import 'package:flutter/material.dart';

class DayPage extends StatefulWidget {
  const DayPage({super.key});

  @override
  State<DayPage> createState() => _DayPageState();
}

class _DayPageState extends State<DayPage> {
  String input = '';
  String output = '';
  bool error = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day Counter'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Input',
                ),
                onChanged: (value) {
                  setState(() {
                    input = value;
                    error = false;
                  });
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                child: const Text('Show results'),
                onPressed: () {
                  setState(() {
                    if (input.isEmpty) {
                      output = 'Input is empty!';
                      error = true;
                    } else if (!input.contains(RegExp(r'^[1-7]$')) || input.contains(RegExp(r'[a-zA-Z]'))) {
                      output = 'Input must be a number 1-7!';
                      error = true;
                    } else {
                      final day = int.parse(input);
                      switch (day) {
                        case 1:
                          output = 'Monday';
                          break;
                        case 2:
                          output = 'Tuesday';
                          break;
                        case 3:
                          output = 'Wednesday';
                          break;
                        case 4:
                          output = 'Thursday';
                          break;
                        case 5:
                          output = 'Friday';
                          break;
                        case 6:
                          output = 'Saturday';
                          break;
                        case 7:
                          output = 'Sunday';
                          break;
                      }
                      error = false;
                    }
                  });
                },
              ),
              const SizedBox(height: 16.0),
              if (error)
                Text(
                  output,
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                )
              else if (output.isNotEmpty)
                Text(
                  output,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}


