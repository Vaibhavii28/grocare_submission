import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:grocare_submission/screens/home_page.dart';
import 'package:grocare_submission/screens/options_screen.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import '../models/video_model.dart';

// List<Video> parseVideos(String responseBody) {
//   final parsed = json.decode(responseBody);
//   final data = parsed['data'];
//   final posts = data['posts'];
//
//   return List<Video>.from(posts.map((post) => Video(
//     postId: post['postId'],
//     creator: Creator(
//       name: post['creator']['name'] ?? '',
//       id: post['creator']['id'],
//       handle: post['creator']['handle'],
//       pic: post['creator']['pic'],
//     ),
//     comment: Comment(
//       count: post['comment']['count'],
//       commentingAllowed: post['comment']['commentingAllowed'],
//     ),
//     reaction: Reaction(
//       count: post['reaction']['count'],
//       voted: post['reaction']['voted'],
//     ),
//     submission: Submission(
//       title: post['submission']['title'],
//       description: post['submission']['description'],
//       mediaUrl: post['submission']['mediaUrl'],
//       thumbnail: post['submission']['thumbnail'],
//       hyperlink: post['submission']['hyperlink'],
//       placeholderUrl: post['submission']['placeholderUrl'],
//     ),
//   )));
// }

List<Video> parseVideos(String responseBody) {
  final parsed = json.decode(responseBody);
  final data = parsed['data'];
  final posts = data['posts'];

  return List<Video>.from(posts.map((post) => Video(
        mediaUrl: post['submission']['mediaUrl'],
        commentCount: post['comment']['count'],
        reactionCount: post['reaction']['count'],
        title: post['submission']['title'],
        creatorHandle: post['creator']['handle'],
        thumbnail: post['submission']['thumbnail'],
        creatorImage: post['creator']['pic'],
      )));
}

Future<List<Video>> fetchVideos(int page) async {
  final url =
      Uri.parse('https://internship-service.onrender.com/videos?page=$page');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    // Successful response
    final videos = parseVideos(response.body);
    return videos;
  } else {
    // Error handling
    print('Request failed with status: ${response.statusCode}.');
    return []; // Return an empty list if an error occurs
  }
}

// Future<List<Video>> fetchVideos2() async {
//   final url = Uri.parse('https://internship-service.onrender.com/videos?page=4');
//   final response = await http.get(url);
//
//   if (response.statusCode == 200) {
//     // Successful response
//     final videos = parseVideos(response.body);
//     return videos;
//   } else {
//     // Error handling
//     print('Request failed with status: ${response.statusCode}.');
//     return []; // Return an empty list if an error occurs
//   }
// }
