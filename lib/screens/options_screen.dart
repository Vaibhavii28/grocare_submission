import 'package:flutter/material.dart';

class OptionsScreen extends StatelessWidget {
  String username = '';
  String title = '';
  int likes = 0;
  int comments = 0;
  String creatorImage = '';

  OptionsScreen(
      {super.key, required this.title,
      required this.username,
      required this.comments,
      required this.likes,
      required this.creatorImage});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height / 5),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 16,
                        child: ClipOval(child: Image.network(creatorImage)),
                      ),
                      SizedBox(width: height / 50),
                      Text(username),
                      SizedBox(width: height / 25),
                      const Icon(Icons.verified, size: 15),
                      SizedBox(width: height / 50),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Follow',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: MediaQuery.of(context).size.height / 50),
                  Text(title),
                  SizedBox(height: MediaQuery.of(context).size.height / 60),
                  const Row(
                    children: [
                      Icon(
                        Icons.music_note,
                        size: 15,
                      ),
                      Text('Original Audio - some music track--'),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 20),
                  // Text('$title'),
                ],
              ),
              Column(
                children: [
                  const Icon(Icons.favorite_outline),
                  Text('$likes'),
                  SizedBox(height: height / 50),
                  const Icon(Icons.comment_rounded),
                  Text('$comments'),
                  SizedBox(height: height / 50),
                  Transform(
                    transform: Matrix4.rotationZ(5.8),
                    child: const Icon(Icons.send),
                  ),
                  SizedBox(height: height / 25),
                  const Icon(Icons.more_vert),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
