import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Medium {
  final String initials;
  final String longName;
  final Map<String, Quantity> ingredients;
  final List<String> steps;
  final String reference;
  final FisicalState whatState;
  final bool isComplement;
  final String ps;
  final bool isFavorite;

  const Medium({
    required this.initials,
    required this.longName,
    required this.ingredients,
    required this.steps,
    this.reference = '',
    this.whatState = FisicalState.liquid,
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
      switch (this.whatState) {
        case FisicalState.liquid:
          return ExactAssetImage(
            'assets/icons/erlenmeyer.png',
            scale: 1,
          );

        case FisicalState.semisolid:
          return ExactAssetImage(
            'assets/icons/petridish_semisolid.png',
            scale: 1,
          );

        case FisicalState.solid:
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

  String setMediumState() {
    if (this.isComplement) {
      return 'Solução complementar para outros meios de cultura';
    } else {
      switch (this.whatState) {
        case FisicalState.liquid:
          return 'Meio líquido';

        case FisicalState.semisolid:
          return 'Meio semi-sólido.';

        case FisicalState.solid:
          return 'Meio sólido';

        default:
          return 'Estado do meio indefinido';
      }
    }
  }
}

enum FisicalState {
  solid,
  semisolid,
  liquid,
}

class Quantity {
  final double amount;
  final String unit;

  const Quantity({
    required this.amount,
    required this.unit,
  });

  String toString() => '$amount$unit';
}
