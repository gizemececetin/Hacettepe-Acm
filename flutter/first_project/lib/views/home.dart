import 'package:first_project/views/post_page.dart';
import 'package:first_project/views/profile_page.dart';
import 'package:flutter/material.dart';

import '../models/post.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final List<Post> postList = List.generate(
    50,
    (index) => Post(
      name: "Post ${index + 1}",
      imageUrl: "https://picsum.photos/536/354",
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfilePage())),
              onLongPress: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PostPage(
                            post: postList.first,
                          ))),
              child: const Icon(
                Icons.person,
                color: Colors.yellow,
              ),
            ),
          ),
        ],
        title: const Text("Home Page"),
      ),
      body: Center(
        child: ListView.separated(
          itemCount: 30,
          itemBuilder: (context, index) {
            return _showPost(postList[index], context);
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              thickness: 1,
              color: Colors.deepPurple,
            );
          },
        ),
      ),
    );
  }

  Widget _showPost(Post post, context) {
    return ListTile(
      title: Text(
        post.name,
      ),
      trailing: IconButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PostPage(
                        post: post,
                      )));
          //    print("Clicked post: $postName");
        },
        icon: Icon(
          Icons.arrow_right_rounded,
          color: Colors.blue.shade700,
          size: 40,
        ),
      ),
      leading: Image.network(
        post.imageUrl,
      ),
    );
  }
}
