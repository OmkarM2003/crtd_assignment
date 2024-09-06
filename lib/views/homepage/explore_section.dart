// Explore Section Widget
import 'package:crtd_assignment/views/homepage/featured_section.dart';
import 'package:flutter/material.dart';

class ExploreSection extends StatelessWidget {
  const ExploreSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(child: Image.asset('assets/img.png')),
    );
  }
}

// Featured Section Widget
class FeaturedSection extends StatelessWidget {
  const FeaturedSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: const [
            FeatureCard(
              color: Color.fromARGB(255, 212, 191, 1),
              icon: Icons.work_outline,
              label: 'Internships',
            ),
            FeatureCard(
              color: Colors.orangeAccent,
              icon: Icons.work_outline,
              label: 'Fresher Jobs',
            ),
            FeatureCard(
              color: Colors.pinkAccent,
              icon: Icons.people,
              label: 'Experienced Jobs',
            ),
          ],
        ),
      ),
    );
  }
}
