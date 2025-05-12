import 'package:flutter/material.dart';
import 'package:week8/core/app_images.dart';

class GalleryScreen extends StatelessWidget {
  GalleryScreen({super.key});

  final List<String> imageUrls = [
    AppImages.img1,
    AppImages.img2,
    AppImages.img3,
    AppImages.img4,
    AppImages.img5,
    AppImages.img6,
    AppImages.img7,
    AppImages.img8,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: const Text(
                  'Gallery',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  itemCount: imageUrls.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 3 / 4,
                  ),
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(imageUrls[index], fit: BoxFit.cover),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
