import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPost extends StatefulWidget {
  String video_url;
  final int pageIndex;
  final int currentPageIndex;
  VideoPost(
      {required this.video_url,
      required this.pageIndex,
      required this.currentPageIndex});

  @override
  _VideoPostState createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost> {
  late VideoPlayerController _playerController;
  bool initialized = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _playerController = VideoPlayerController.asset(widget.video_url)
      ..initialize().then((value) {
        setState(() {
          _playerController.setLooping(true);
          initialized = true;
        });
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _playerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (initialized && widget.currentPageIndex == widget.pageIndex) {
      _playerController.seekTo(Duration(microseconds: 0));
      _playerController.play();
    } else {
      _playerController.pause();
    }
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: VideoPlayer(_playerController),
      ),
    );
  }
}
