import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '/models/favorite.dart';
import '/models/medium.dart';
import 'medium_card.dart';

class ListWidget extends StatefulWidget {
  @override
  _ListWidgetState createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('media')
          .orderBy('initials')
          .snapshots(),
      builder: (BuildContext ctx,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> media) {
        if (media.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        var docs = media.data!.docs;
        var box = Hive.box<Favorite>('favorites');

        return ListView.builder(
          itemCount: media.data!.docs.length,
          itemBuilder: (ctx, i) {
            Medium md = Medium(
              initials: docs[i].get('initials') ?? '',
              longName: docs[i].get('longName') ?? '',
              ingredients: Medium.getIngredients(docs, i),
              steps: docs[i].get('steps').cast<String>() ?? <String>[],
              mediumState: PhysicalState.values.elementAt(
                docs[i].get('mediumState') ?? PhysicalState.undefined,
              ),
              reference: docs[i].data().containsKey('reference')
                  ? docs[i].get('reference')
                  : '',
              isComplement: docs[i].data().containsKey('isComplement')
                  ? docs[i].get('isComplement')
                  : false,
              ps: docs[i].data().containsKey('ps') ? docs[i].get('ps') : '',
              use: docs[i].data().containsKey('use') ? docs[i].get('use') : '',
              pH: docs[i].data().containsKey('pH') ? docs[i].get('pH') : '',
            );

            if (box.get(docs[i].get('initials')) == null) {
              box.put(
                docs[i].get('initials'),
                Favorite(
                  initials: docs[i].get('initials'),
                  isFavorite: false,
                ),
              );
            }
            return MediumCard(
              medium: md,
            );
          },
        );
      },
    );
  }
}
