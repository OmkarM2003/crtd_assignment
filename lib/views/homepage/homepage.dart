import 'package:crtd_assignment/controllers/name_provider.dart';
import 'package:crtd_assignment/views/homepage/explore_section.dart';
import 'package:crtd_assignment/views/homepage/opportunities_list.dart';
import 'package:crtd_assignment/views/homepage/profile_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Main Homepage class
class Homepage extends ConsumerStatefulWidget {
  const Homepage({super.key});

  @override
  HomepageState createState() => HomepageState();
}

class HomepageState extends ConsumerState<Homepage> {
  @override
  Widget build(BuildContext context) {
    String name = ref.watch(nameprovider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 15),
            ProfileSection(name: name),
            const SectionHeader(title: "Explore Hiremi"),
            const ExploreSection(),
            const SectionHeader(title: "Hiremi's Featured"),
            const FeaturedSection(),
            const SectionHeader(title: "Latest Opportunities"),
            OpportunitiesList(),
          ],
        ),
      ),
    );
  }
}



