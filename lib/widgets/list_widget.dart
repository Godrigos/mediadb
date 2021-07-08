import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '/models/medium.dart';
import 'medium_card.dart';

class ListWidget extends StatefulWidget {
  @override
  _ListWidgetState createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  var box = Hive.box<Medium>('media');

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: box.values.toList().length,
      itemBuilder: (ctx, index) {
        Medium md = box.values.toList()[index];
        return MediumCard(
          mdKey: md.key,
        );
      },
    );
  }
}
