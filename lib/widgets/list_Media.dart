import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '/widgets/medium_card.dart';

ListView listMedia({
  List<QueryDocumentSnapshot<Map<String, dynamic>>> docs = const [],
  List<QueryDocumentSnapshot<Map<String, dynamic>>> list = const [],
}) {
  return ListView.builder(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    itemCount: docs.length,
    itemBuilder: (ctx, i) {
      return MediumCard(
        docs: docs,
        i: i,
        list: list,
      );
    },
  );
}
