import 'package:flutter/material.dart';
import '../widgets/medium_card.dart';
import '../data/media.dart';

class MediaScreen extends StatelessWidget {
  final mediaList = [...media];
  final favoriteList = [];

  @override
  Widget build(BuildContext context) {
    mediaList.sort((a, b) {
      return a.initials.toLowerCase().compareTo(b.initials.toLowerCase());
    });

    return ListView.builder(
      itemCount: mediaList.length,
      itemBuilder: (ctx, index) {
        final md = mediaList[index];
        return MediumCard(
          medium: md,
        );
      },
    );
  }
}
