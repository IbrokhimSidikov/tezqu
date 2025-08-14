import 'package:flutter/material.dart';
import 'package:tezqu/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 214, 135, 18)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'TezQu'),
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/home',
        title: 'TezQu',
        theme: ThemeData(
          fontFamily: 'SFCompact',
          textTheme: const TextTheme(
            bodyMedium: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        routes: {
          '/home': (context) => const HomePage(),
        });
  }
}
