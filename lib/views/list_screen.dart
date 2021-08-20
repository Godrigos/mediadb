import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mediadb/widgets/list_Media.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context)!.settings.arguments as Map;
    final List<QueryDocumentSnapshot<Map<String, dynamic>>> docs = args['docs'];
    final List<QueryDocumentSnapshot<Map<String, dynamic>>> list = args['list'];
    final String catTitle = args['title'];

    return Scaffold(
      appBar: AppBar(
        title: Text(catTitle),
      ),
      body: SafeArea(
        child: listMedia(docs: docs, list: list),
      ),
    );
  }
}
