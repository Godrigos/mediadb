import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Medium {
  final String initials;
  final String longName;
  final Map<String, Quantity> ingredients;
  final List<String> steps;
  final PhysicalState mediumState;
  String reference;
  bool isComplement;
  String ps;

  Medium({
    required this.initials,
    required this.longName,
    required this.ingredients,
    required this.steps,
    required this.mediumState,
    this.reference = '',
    this.isComplement = false,
    this.ps = '',
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

enum PhysicalState {
  solid, // 0
  semisolid, // 1
  liquid, // 2
  undefined, // 3
}
