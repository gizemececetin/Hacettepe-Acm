import 'package:first_project/models/post_place_holder.dart';
import 'package:flutter/material.dart';

import 'icon_button/custom_icon_button.dart';

class PostCard extends StatelessWidget {
  final PostPlaceHolder post;
  final VoidCallback onPressed;
  final IconData icon;
  const PostCard({
    super.key,
    required this.post,
    required this.onPressed,
    required this.icon,
  });
  final String imageUrl = "https://picsum.photos/536/354";

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListTile(
          title: Text(
            post.title ?? "",
          ),
          trailing: CustomIconButton(
            onPressed: onPressed,
            icon: icon,
          ),
          leading: Image.network(
            imageUrl,
          ),
        ),
      ),
    );
  }
}
