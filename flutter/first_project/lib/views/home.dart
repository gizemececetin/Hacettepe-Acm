import 'package:first_project/services/place_holder_service.dart';
import 'package:first_project/views/components/post_card.dart';
import 'package:first_project/views/post_page.dart';
import 'package:first_project/views/profile_page.dart';
import 'package:flutter/material.dart';

import '../enums/snackbar_type_enum.dart';
import '../models/post.dart';
import '../models/post_place_holder.dart';
import 'favorites_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PlaceHolderService _placeHolderService = PlaceHolderService();
  final String imageUrl = "https://picsum.photos/536/354";
  final List<Post> postList = List.generate(
    50,
    (index) => Post(
      name: "Post ${index + 1}",
      imageUrl: "https://picsum.photos/536/354",
    ),
  );

  bool _isLoading = true;

  late final List<PostPlaceHolder> postPlaceHolderList;
  @override
  void initState() {
    super.initState();
    getPostList();
  }

  Future<void> getPostList() async {
    await _placeHolderService.getPosts().then((value) {
      setState(() {
        postPlaceHolderList = value;
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      appBar: _buildAppBar(context),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _buildBody(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      actions: [
        _buildProfileButton(context),
      ],
      leading: _buildFavoritesButton(),
      title: const Text("Home Page"),
    );
  }

  Padding _buildProfileButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProfilePage()),
        ),
        onLongPress: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PostPage(
              post: postPlaceHolderList.first,
            ),
          ),
        ),
        child: const Icon(
          Icons.person,
          color: Colors.yellow,
        ),
      ),
    );
  }

  Widget _buildFavoritesButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FavoritesPage(postList: postPlaceHolderList),
          ),
        ),
        child: const Icon(
          Icons.favorite,
          color: Colors.yellow,
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Center(
      child: ListView.separated(
        itemCount: 20,
        itemBuilder: (context, index) {
          return _buildPost(postPlaceHolderList[index], context, index);
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

  Widget _buildPost(PostPlaceHolder post, BuildContext context, int index) {
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

  Widget _buildPostCard(context, PostPlaceHolder post) {
    return PostCard(
      post: post,
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PostPage(
            post: post,
          ),
        ),
      ),
      icon: Icons.arrow_right_rounded,
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
