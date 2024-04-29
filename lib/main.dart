import 'package:flutter/material.dart';
import 'trapezoid.dart';
import 'cube.dart';
import 'day.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kuis TPM',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyanAccent),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const PersonalData(),
    const TrapezoidPage(),
    const CubePage(),
    const DayPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.cyan,
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Personal Data',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.keyboard_command_key),
            label: 'Trapezoid',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.square),
            label: 'Cube',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Day',
          ),
        ],
      ),
    );
  }
}

class PersonalData extends StatelessWidget {
  const PersonalData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Data'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 150,
              backgroundColor: Colors.transparent,
              child: Image.asset('assets/profile.jpeg'),
            ),
            const SizedBox(height: 16),
            const Text('ID : 123210025'),
            const SizedBox(height: 16),
            const Text('Name : Yoga Agatha Pasaribu'),
            const SizedBox(height: 16),
            const Text('Class : IF-B'),
            const SizedBox(height: 16),
            const Text('Hobby : Basket and Playing Games'),
          ],
        ),
      ),
    );
  }
}

