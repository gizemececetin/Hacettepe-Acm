import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        automaticallyImplyLeading: true,
      ),
      body: Center(
          child: Column(
        children: [
          Image.asset("assets/profile_image.jpeg"),
          const SizedBox(
            height: 20,
          ),
          const Text("Gizem Ece Çetin"),
          const Text("Ankara"),
        ],
      )),
    );
  }
}
