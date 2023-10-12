import 'package:crud/screen/floating_screen.dart';
import 'package:flutter/material.dart';
import 'package:crud/screen/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();

    return MaterialApp(
      title: "Crud Operations",
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          brightness: Brightness.dark,
        ),
        textTheme: TextTheme(
          displayLarge: const TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: GoogleFonts.oswald(
            fontSize: 30,
            fontStyle: FontStyle.italic,
          ),
          bodyMedium: GoogleFonts.merriweather(),
          displaySmall: GoogleFonts.pacifico(),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Crud Operations'),
        ),
        body: const HomeScreen(),
        floatingActionButton: FloatingActionButton.small(
          onPressed: () {
            // Add your onPressed logic here
            _showFloatingWidget(context);
          },
          child: const Icon(Icons.add), // You can use any icon you like
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation
            .endFloat, // Positions FAB at the bottom end
      ),
    );
  }
    void _showFloatingWidget(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const CustomDialog(); // Use a custom dialog with text fields
      },
    );
  }
}


