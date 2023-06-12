import 'dart:convert';

import 'package:first_project/models/post_place_holder.dart';
import 'package:http/http.dart' as http;

class PlaceHolderService {
  Future<List<PostPlaceHolder>> getPosts() async {
    const String baseUrl = "https://jsonplaceholder.typicode.com/";
    const String path = "posts";

    final response = await http.get(Uri.parse(baseUrl + path));

    switch (response.statusCode) {
      case 200:
        final body = jsonDecode(response.body);
        if (body is List) {
          return body.map((e) => PostPlaceHolder.fromJson(e)).toList();
        } else {
          return [];
        }
      default:
        return [];
    }
  }
}
