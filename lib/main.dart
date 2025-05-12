import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:week8/core/app_colors.dart';
import 'package:week8/navigation_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: AppColors.background,
         textTheme: GoogleFonts.quicksandTextTheme(),
     
      ),
      home: MainNavigationScreen(),
    );
  }
}
