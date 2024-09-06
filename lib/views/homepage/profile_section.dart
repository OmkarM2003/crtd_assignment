import 'package:flutter/material.dart';
// Profile Section Widget
class ProfileSection extends StatelessWidget {
  final String name;
  const ProfileSection({required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color.fromARGB(255, 197, 197, 197)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ProfileDetails(name: name),
            VerifyButton(),
          ],
        ),
      ),
    );
  }
}

// Profile Details Widget
class ProfileDetails extends StatelessWidget {
  final String name;
  const ProfileDetails({required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const Icon(Icons.check_circle_outline,
                  color: Colors.grey, size: 18),
              const Text('Not Verified',
                  style: TextStyle(color: Colors.grey, fontSize: 10)),
            ],
          ),
          const Text('App ID: -- -- -- --',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

// Verify Button Widget
class VerifyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.green,
        ),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.check_circle, color: Colors.white),
                SizedBox(width: 5),
                Text('Verify Now >',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Section Header Widget
class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Text(title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
    );
  }
}
