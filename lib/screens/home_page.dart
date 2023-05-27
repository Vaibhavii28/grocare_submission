import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/video_provider.dart';
import 'content_screen.dart';

class HomePage extends StatefulWidget {
  int currentpage;
  int currentindex;

  HomePage({required this.currentpage, required this.currentindex});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Consumer<VideoProvider>(builder: (context, value, child) {
                return Swiper(
                  index: widget.currentindex,
                  itemBuilder: (BuildContext context, int index) {
                    return ContentScreen(
                      video: value.videos[index],
                    );
                  },
                  itemCount: value.videos.length,
                  scrollDirection: Axis.vertical,
                );
              }),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Flutter Shorts',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Icon(Icons.camera_alt),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
