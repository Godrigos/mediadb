import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '/widgets/medium_card.dart';

ListView listMedia(
    {List<QueryDocumentSnapshot<Map<String, dynamic>>> docs = const []}) {
  return ListView.builder(
    itemCount: docs.length,
    itemBuilder: (ctx, i) {
      return MediumCard(
        docs: docs,
        i: i,
      );
    },
  );
}
