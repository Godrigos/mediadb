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
  bool caution;

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
    this.caution = false,
  });

  ExactAssetImage setBGImage() {
    if (isComplement) {
      return const ExactAssetImage(
        'assets/icons/becker.png',
        scale: 1,
      );
    } else {
      switch (mediumState) {
        case PhysicalState.liquid:
          return const ExactAssetImage(
            'assets/icons/erlenmeyer.png',
            scale: 1,
          );

        case PhysicalState.semisolid:
          return const ExactAssetImage(
            'assets/icons/petridish_semisolid.png',
            scale: 1,
          );

        case PhysicalState.solid:
          return const ExactAssetImage(
            'assets/icons/petridish_solid.png',
            scale: 1,
          );

        default:
          return const ExactAssetImage(
            'assets/icons/petridish.png',
            scale: 1,
          );
      }
    }
  }

  static Map<String, Quantity> getIngredients(
      QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    Map<String, Quantity> ingredients = {};

    if (doc.data().containsKey('ingredients')) {
      for (var e in Map.from(doc.get('ingredients')).entries) {
        ingredients[e.key] = Quantity(
          amount: e.value['amount'].toDouble(),
          unit: e.value['unit'],
        );
      }
    }
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
  @override
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
  double initialVolume = ingredients['volume']!.amount;
  for (var e in ingredients.values) {
    e.amount = (e.amount / initialVolume) * multiplier;
  }
  return ingredients;
}

extension Ex on double {
  String toStringAsFixedNoZero(int n) =>
      double.parse(toStringAsFixed(n)).toString();
}
