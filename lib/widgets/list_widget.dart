import 'package:flutter/material.dart';
import 'package:mediadb/utils/mediumFromFirestore.dart';

class ListWidget extends StatefulWidget {
  @override
  _ListWidgetState createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  @override
  Widget build(BuildContext context) {
    return mediumFromFirestore();
  }
}
