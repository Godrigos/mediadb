import 'package:cloud_firestore/cloud_firestore.dart';

import '/models/medium.dart';

Medium parseFirestoreMedia(
    final QueryDocumentSnapshot<Map<String, dynamic>> doc) {
  Medium md = Medium(
    initials: doc.data().containsKey('initials') ? doc.get('initials') : '',
    longName: doc.data().containsKey('longName') ? doc.get('longName') : '',
    ingredients: Medium.getIngredients(doc),
    steps: doc.data().containsKey('steps')
        ? doc.get('steps').cast<String>()
        : <String>[],
    mediumState: doc.data().containsKey('mediumState')
        ? PhysicalState.values.elementAt(doc.get('mediumState'))
        : PhysicalState.undefined,
    organism: doc.data().containsKey('organism')
        ? doc.get('organism').cast<String>()
        : <String>[],
    reference: doc.data().containsKey('reference') ? doc.get('reference') : '',
    isComplement: doc.data().containsKey('isComplement')
        ? doc.get('isComplement')
        : false,
    complement: doc.data().containsKey('complement')
        ? doc.get('complement').cast<String>()
        : <String>[],
    ps: doc.data().containsKey('ps') ? doc.get('ps') : '',
    use: doc.data().containsKey('use') ? doc.get('use') : '',
    pH: doc.data().containsKey('pH') ? doc.get('pH') : '',
  );
  return md;
}
