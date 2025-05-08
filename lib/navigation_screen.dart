import 'package:flutter/material.dart';
import 'package:week8/BMI/bmi_screen.dart';
import 'package:week8/Gallery/gallery_screen.dart';
import 'package:week8/Notes/notes_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const BmiScreen(),
    const GalleryScreen(),
    const NotesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.calculate)),
          BottomNavigationBarItem(icon: Icon(Icons.image)),
          BottomNavigationBarItem(icon: Icon(Icons.note)),
        ],
      ),
    );
  }
}

class CustomBottomNavigationBarItem extends StatelessWidget {
  const CustomBottomNavigationBarItem({super.key, required this.icon});
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      onPressed: () {
        if (icon.icon == Icons.calculate) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BmiScreen()),
          );
        } else if (icon.icon == Icons.image) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const GalleryScreen()),
          );
        } else if (icon.icon == Icons.note) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NotesScreen()),
          );
        }
      },
    );
  }
}
