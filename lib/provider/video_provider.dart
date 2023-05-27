import 'package:flutter/cupertino.dart';
import 'package:grocare_submission/models/video_model.dart';

class VideoProvider with ChangeNotifier {
  List<Video> _videosList = [];

  List<Video> get videos => _videosList;

  set videos(List<Video> value) {
    _videosList = value;
    notifyListeners();
  }
}
