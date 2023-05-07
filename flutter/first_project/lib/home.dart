import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Home Page"),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.home,
              color: Colors.yellow,
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              "Merhaba",
            ),
            const Text(
              "Flutter",
            ),
            const Text(
              "İlk",
            ),
            const Text(
              "Projem",
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
              child: Container(color: Colors.orange, height: 100, width: 100),
            ),
            Container(color: Colors.blue, height: 100, width: 100),
            const Text("Mavi"),
          ],
        ),
      ),
    );
  }
}
