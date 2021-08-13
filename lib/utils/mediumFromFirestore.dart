import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '/models/favorite.dart';
import '/widgets/medium_card.dart';
import '/models/medium.dart';

mediumFromFirestore([List<String> name = const []]) {
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
      List<QueryDocumentSnapshot<Map<String, dynamic>>> docs = [];
      if (name.isNotEmpty) {
        docs = media.data!.docs.where((e) {
          return name.contains(e.get('initials'));
        }).toList();
      } else {
        docs = media.data!.docs;
      }
      var box = Hive.box<Favorite>('favorites');

      return ListView.builder(
        itemCount: docs.length,
        itemBuilder: (ctx, i) {
          Medium md = Medium(
            initials: docs[i].data().containsKey('initials')
                ? docs[i].get('initials')
                : '',
            longName: docs[i].data().containsKey('longName')
                ? docs[i].get('longName')
                : '',
            ingredients: Medium.getIngredients(docs[i]),
            steps: docs[i].data().containsKey('steps')
                ? docs[i].get('steps').cast<String>()
                : <String>[],
            mediumState: docs[i].data().containsKey('mediumState')
                ? PhysicalState.values.elementAt(docs[i].get('mediumState'))
                : PhysicalState.undefined,
            organism: docs[i].data().containsKey('organism')
                ? docs[i].get('organism').cast<String>()
                : <String>[],
            reference: docs[i].data().containsKey('reference')
                ? docs[i].get('reference')
                : '',
            isComplement: docs[i].data().containsKey('isComplement')
                ? docs[i].get('isComplement')
                : false,
            complement: docs[i].data().containsKey('complement')
                ? docs[i].get('complement').cast<String>()
                : <String>[],
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
