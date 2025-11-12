import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
      ),
      home: const MyHomePage(title: 'Gato aleatorio'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<String> _imagenes = List.generate(
    69,
        (i) => 'assets/imagenes/Data/cat_${i + 1}.png',
  );

  late String _currentImage;

  @override
  void initState() {
    super.initState();
    _currentImage = _imagenes.first;
  }

  void _showRandomImage() {
    final random = Random();
    setState(() {
      _currentImage = _imagenes[random.nextInt(_imagenes.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2080FE),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            const Text('Gato'),
            Image.asset(_currentImage, height: 64,width: 64),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: _showRandomImage,
                child: Text('Nuevo gato'),
            ),
          ],
        ),
      ),
    );
  }
}
