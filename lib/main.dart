import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NameGeneratorPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class NameGeneratorPage extends StatefulWidget {
  const NameGeneratorPage({super.key});

  @override
  State<NameGeneratorPage> createState() => _NameGeneratorPageState();
}

class _NameGeneratorPageState extends State<NameGeneratorPage> {
  String _name = '';

  void _generateName() {
    final faker = Faker();
    setState(() {
      _name = '${faker.person.firstName()} ${faker.person.lastName()}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerador de Nome Aleatório'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _name.isEmpty ? 'Clique para gerar um nome' : _name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _generateName,
              child: const Text('Gerar Nome'),
            ),
          ],
        ),
      ),
    );
  }
}
