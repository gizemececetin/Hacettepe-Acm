import 'package:flutter/material.dart';

import '../models/post.dart';

class PostPage extends StatelessWidget {
  final Post post;
  const PostPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Post Name: ${post.name}"),
            GestureDetector(
              onTap: () => print("Clicked on image"),
              child: Image.network(post.imageUrl),
            ),
          ],
        ),
      ),
    );
  }
}
