import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:week8/core/app_colors.dart';
import 'package:week8/feature/BMI/data/bmi_repository.dart';
import 'package:week8/feature/BMI/domain/cubit/bmi_cubit.dart';
import 'package:week8/navigation_screen.dart';
// Add this if you have SubjectBloc
// import 'package:week8/feature/subject/domain/cubit/subject_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => BmiCubit(BmiRepository()))],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          scaffoldBackgroundColor: AppColors.background,
          textTheme: GoogleFonts.quicksandTextTheme(),
        ),
        home: const MainNavigationScreen(),
      ),
    );
  }
}
