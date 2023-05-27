import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/video_model.dart';

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

