import 'package:first_project/models/post_place_holder.dart';
import 'package:first_project/views/components/post_card.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesPage extends StatefulWidget {
  final List<PostPlaceHolder> postList;
  const FavoritesPage({super.key, required this.postList});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<String> favoriteList = [];
  final String favoriteKey = "favoriteList";

  @override
  void initState() {
    super.initState();
    getFavorite();
  }

  Future<void> saveFavorite(int id) async {
    favoriteList.add(id.toString());
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(favoriteKey, favoriteList);
  }

  Future<void> getFavorite() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? favoritesIdList = prefs.getStringList(favoriteKey);
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Favorites"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => PostCard(
          icon: Icons.favorite,
          onPressed: () {
            if (widget.postList[index].id != null) {
              saveFavorite(widget.postList[index].id!);
            }
          },
          post: widget.postList[index],
        ),
      ),
    );
  }
}
