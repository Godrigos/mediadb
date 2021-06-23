import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Medium with ChangeNotifier {
  final String initials;
  final String longName;
  final Map<String, Quantity> ingredients;
  final List<String> steps;
  final String reference;
  final PhysicalState mediumState;
  final bool isComplement;
  final String ps;
  bool isFavorite;

  Medium({
    required this.initials,
    required this.longName,
    required this.ingredients,
    required this.steps,
    required this.mediumState,
    this.reference = '',
    this.isComplement = false,
    this.ps = '',
    this.isFavorite = false,
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

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}

enum PhysicalState {
  solid,
  semisolid,
  liquid,
  undefined,
}

class Quantity {
  final double amount;
  final String unit;

  const Quantity({
    required this.amount,
    required this.unit,
  });

  String toString() => '$amount $unit';
}
