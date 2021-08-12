import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '/models/favorite.dart';
import '/widgets/medium_card.dart';
import '/models/medium.dart';

mediumFromFirebase(String name) {
  return StreamBuilder(
    stream:
        FirebaseFirestore.instance.collection('media').doc(name).snapshots(),
    builder: (ctx, AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> doc) {
      if (doc.connectionState == ConnectionState.waiting) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }

      var document = doc.data!;
      var box = Hive.box<Favorite>('favorites');

      if (box.get(document.get('initials')) == null) {
        box.put(
          document.get('initials'),
          Favorite(
            initials: document.get('initials'),
            isFavorite: false,
          ),
        );
      }

      return MediumCard(
        medium: Medium(
          initials: document.data()!.containsKey('initials')
              ? document.get('initials')
              : '',
          longName: document.data()!.containsKey('longName')
              ? document.get('longName')
              : '',
          ingredients: _getIngredients(doc),
          steps: document.data()!.containsKey('steps')
              ? document.get('steps').cast<String>()
              : <String>[],
          mediumState: document.data()!.containsKey('mediumState')
              ? PhysicalState.values.elementAt(document.get('mediumState'))
              : PhysicalState.undefined,
          organism: document.data()!.containsKey('organism')
              ? document.get('organism').cast<String>()
              : <String>[],
          reference: document.data()!.containsKey('reference')
              ? document.get('reference')
              : '',
          isComplement: document.data()!.containsKey('isComplement')
              ? document.get('isComplement')
              : false,
          complement: document.data()!.containsKey('complement')
              ? document.get('complement')
              : '',
          ps: document.data()!.containsKey('ps') ? document.get('ps') : '',
          use: document.data()!.containsKey('use') ? document.get('use') : '',
          pH: document.data()!.containsKey('pH') ? document.get('pH') : '',
        ),
      );
    },
  );
}

Map<String, Quantity> _getIngredients(
    AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> doc) {
  Map<String, Quantity> ingredients = {};

  if (doc.hasData)
    Map.from(doc.data!.get('ingredients')).entries.forEach((e) {
      ingredients[e.key] = Quantity(
        amount: e.value['amount'].toDouble(),
        unit: e.value['unit'],
      );
    });
  return ingredients;
}
