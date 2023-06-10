import 'package:first_project/views/post_page.dart';
import 'package:first_project/views/profile_page.dart';
import 'package:flutter/material.dart';

import '../enums/snackbar_type_enum.dart';
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
      backgroundColor: Colors.deepPurple.shade100,
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProfilePage())),
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
    );
  }

  Widget _buildBody() {
    return Center(
      child: ListView.separated(
        itemCount: 30,
        itemBuilder: (context, index) {
          return _buildPost(postList[index], context, index);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            thickness: 1,
            color: Colors.deepPurple,
          );
        },
      ),
    );
  }

  Widget _buildPost(Post post, BuildContext context, int index) {
    return Dismissible(
        key: UniqueKey(),
        confirmDismiss: (direction) {
          if (direction == DismissDirection.endToStart) {
            return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Warning"),
                    content: const Text("Are you sure?"),
                    actions: [
                      TextButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: const Text("Yes")),
                      TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: const Text("No")),
                    ],
                  );
                });
          } else {
            return Future.value(true);
          }
        },
        onDismissed: (direction) {
          if (direction == DismissDirection.endToStart) {
            showSnackBar(context, SnackBarTypeEnum.WARNING);
            postList.removeAt(index);
          } else {
            showSnackBar(context, SnackBarTypeEnum.SUCCESS);
          }
        },
        background: Container(
          color: Colors.green,
          child: const Icon(
            Icons.archive,
            color: Colors.white,
          ),
        ),
        secondaryBackground: Container(
          color: Colors.red,
          child: const Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
        child: _buildPostCard(context, post));
  }

  Widget _buildPostCard(context, post) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListTile(
          title: Text(
            post.name,
          ),
          trailing: _buildIconButton(context, post),
          leading: Image.network(
            post.imageUrl,
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton(BuildContext context, Post post) {
    return IconButton(
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
    );
  }

  void showSnackBar(BuildContext context, SnackBarTypeEnum snackBarType) {
    SnackBar snackBar = SnackBar(
      backgroundColor: snackBarType.color,
      content: Row(children: [
        Icon(snackBarType.icon),
        Text(snackBarType.message, style: TextStyle(color: Colors.white)),
      ]),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
