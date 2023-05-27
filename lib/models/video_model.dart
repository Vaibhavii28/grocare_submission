class Video {
  final String mediaUrl;
  final int commentCount;
  final int reactionCount;
  final String title;
  final String creatorHandle;
  final String thumbnail;
  final String creatorImage;

  Video({
    required this.mediaUrl,
    required this.commentCount,
    required this.reactionCount,
    required this.title,
    required this.creatorHandle,
    required this.thumbnail,
    required this.creatorImage,
  });
}

class Creator {
  final String handle;
  final String creatorImage;

  Creator({
    required this.handle, required this.creatorImage
  });
}

class Comment {
  final int count;

  Comment({
    required this.count,
  });
}

class Reaction {
  final int count;

  Reaction({
    required this.count,
  });
}

class Submission {
  final String title;
  final String mediaUrl;
  final String thumbnail;

  Submission({
    required this.title,
    required this.mediaUrl,
    required this.thumbnail,
  });
}

