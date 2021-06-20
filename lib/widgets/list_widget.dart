import 'package:flutter/material.dart';

import '/models/media_list.dart';
import '/models/medium.dart';
import 'medium_card.dart';

class ListWidget extends StatelessWidget {
  final List<Medium> _mediaList = MediaList().sortList();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _mediaList.length,
      itemBuilder: (ctx, index) {
        Medium md = _mediaList[index];
        return MediumCard(
          medium: md,
        );
      },
    );
  }
}
