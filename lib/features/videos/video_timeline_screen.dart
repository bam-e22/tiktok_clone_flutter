import 'dart:math';

import 'package:flutter/material.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({Key? key}) : super(key: key);

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  int _itemCount = 4;
  final List<Color> _colors = [
    Colors.blue,
    Colors.teal,
    Colors.yellow,
    Colors.amber
  ];

  void _onPageChanged(int page) {
    var moreItemCount = 4;
    if (page == _itemCount - 1) {
      for (var i = 0; i < moreItemCount; i++) {
        _colors.add(
            Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0));
      }
      setState(() {
        _itemCount += moreItemCount;
      });
      print("_itemCount= $_itemCount, colors= $_colors");
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: _itemCount,
      onPageChanged: _onPageChanged,
      itemBuilder: (context, index) => Container(
        color: _colors[index],
        child: Center(
          child: Text(
            '$index',
            style: TextStyle(
              fontSize: 48,
            ),
          ),
        ),
      ),
    );
  }
}
