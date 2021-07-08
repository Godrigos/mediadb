import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';

part 'medium.g.dart';

@HiveType(typeId: 0)
class Medium extends HiveObject with ChangeNotifier {
  @HiveField(0)
  final String initials;
  @HiveField(1)
  final String longName;
  @HiveField(2)
  final Map<String, Quantity> ingredients;
  @HiveField(3)
  final List<String> steps;
  @HiveField(4)
  final String reference;
  @HiveField(5)
  final PhysicalState mediumState;
  @HiveField(6)
  final bool isComplement;
  @HiveField(7)
  final String ps;
  @HiveField(8)
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

  void toggleFavorite(mdKey) {
    var i = Hive.box<Medium>('media').get(mdKey);
    i!.isFavorite = !isFavorite;
    i.save();
    notifyListeners();
  }
}

@HiveType(typeId: 1)
class Quantity {
  @HiveField(0)
  final double amount;
  @HiveField(1)
  final String unit;

  const Quantity({
    required this.amount,
    required this.unit,
  });

  String toString() => '$amount $unit';
}

@HiveType(typeId: 2)
enum PhysicalState {
  @HiveField(0)
  solid,
  @HiveField(1)
  semisolid,
  @HiveField(2)
  liquid,
  @HiveField(3)
  undefined,
}
