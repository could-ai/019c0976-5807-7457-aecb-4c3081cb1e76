import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/add_note_screen.dart';
import 'screens/study_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sinhala Study Notes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
        // Ensure fonts are handled gracefully if not present, but standard system fonts usually work for Sinhala
        fontFamily: 'Roboto', 
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/add': (context) => const AddNoteScreen(),
        '/study': (context) => const StudyScreen(),
      },
    );
  }
}
