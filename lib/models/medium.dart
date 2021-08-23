import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Medium {
  final String initials;
  final String longName;
  final Map<String, Quantity> ingredients;
  final List<String> steps;
  final PhysicalState mediumState;
  bool isComplement;
  List<String> organism;
  String reference;
  List<String> complement;
  String ps;
  String use;
  String pH;

  Medium({
    required this.initials,
    required this.longName,
    required this.ingredients,
    required this.steps,
    required this.mediumState,
    this.isComplement = false,
    this.organism = const <String>[],
    this.reference = '',
    this.complement = const <String>[],
    this.ps = '',
    this.use = '',
    this.pH = '',
  });

  ExactAssetImage setBGImage() {
    if (this.isComplement) {
      return ExactAssetImage(
        'assets/icons/becker.png',
        scale: 1,
      );
    } else {
      switch (this.mediumState) {
        case PhysicalState.liquid:
          return ExactAssetImage(
            'assets/icons/erlenmeyer.png',
            scale: 1,
          );

        case PhysicalState.semisolid:
          return ExactAssetImage(
            'assets/icons/petridish_semisolid.png',
            scale: 1,
          );

        case PhysicalState.solid:
          return ExactAssetImage(
            'assets/icons/petridish_solid.png',
            scale: 1,
          );

        default:
          return ExactAssetImage(
            'assets/icons/petridish.png',
            scale: 1,
          );
      }
    }
  }

  static Map<String, Quantity> getIngredients(
      QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    Map<String, Quantity> ingredients = {};

    if (doc.data().containsKey('ingredients'))
      Map.from(doc.get('ingredients')).entries.forEach(
        (e) {
          ingredients[e.key] = Quantity(
            amount: e.value['amount'].toDouble(),
            unit: e.value['unit'],
          );
        },
      );
    return ingredients;
  }
}

class Quantity {
  double amount;
  final String unit;

  Quantity({
    required this.amount,
    required this.unit,
  });
  String toString() => '${amount.toStringAsFixedNoZero(4)} $unit';
}

enum PhysicalState {
  solid, // 0
  semisolid, // 1
  liquid, // 2
  undefined, // 3
}

Map<String, Quantity> multiply(
  Map<String, Quantity> ingredients,
  double multiplier,
) {
  double initialVolume = ingredients['dH₂O']!.amount;
  ingredients.values.forEach((e) {
    e.amount = (e.amount / initialVolume) * multiplier;
  });
  return ingredients;
}

extension Ex on double {
  String toStringAsFixedNoZero(int n) =>
      double.parse(this.toStringAsFixed(n)).toString();
}
