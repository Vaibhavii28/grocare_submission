  import 'package:chewie/chewie.dart';
  import 'package:flutter/material.dart';
  import 'package:grocare_submission/utils/api_call.dart';
  import '../models/video_model.dart';
  import '../utils/api_call.dart';
  import 'like_icon.dart';
  import 'options_screen.dart';
  import 'package:video_player/video_player.dart';

  class ContentScreen extends StatefulWidget {
    final Video video;
    ContentScreen({required this.video});

    @override
    _ContentScreenState createState() => _ContentScreenState();
  }

  class _ContentScreenState extends State<ContentScreen> {
    late VideoPlayerController _videoPlayerController;
    ChewieController? _chewieController;
    bool _liked = false;
    @override
    void initState() {
      super.initState();
      initializePlayer();
    }

    Future initializePlayer() async {
      _videoPlayerController = VideoPlayerController.network(widget.video.mediaUrl);
      await Future.wait([_videoPlayerController.initialize()]);
      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        autoPlay: true,
        showControls: false,
        looping: true,
      );
      setState(() {});
    }

    @override
    void dispose() {
      _videoPlayerController.dispose();
      _chewieController!.dispose();
      super.dispose();
    }

    @override
    Widget build(BuildContext context) {
      return Stack(
        fit: StackFit.expand,
        children: [
          _chewieController != null &&
              _chewieController!.videoPlayerController.value.isInitialized
              ? GestureDetector(
            onDoubleTap: () {
              setState(() {
                _liked = !_liked;
              });
            },
            child: Chewie(
              controller: _chewieController!,
            ),
          )
              : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 10),
              Text('Loading...')
            ],
          ),
          if (_liked)
            Center(
              child: LikeIcon(),
            ),
          OptionsScreen(comments: widget.video.commentCount, likes: widget.video.reactionCount, title: widget.video.title, username: widget.video.creatorHandle, creatorImage: widget.video.creatorImage,)
        ],
      );
    }
  }