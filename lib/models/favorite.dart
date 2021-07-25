import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'favorite.g.dart';

@HiveType(typeId: 0)
class Favorite extends HiveObject with ChangeNotifier {
  @HiveField(0)
  final String initials;
  @HiveField(1)
  bool isFavorite;

  Favorite({required this.initials, required this.isFavorite});

  void toggleFavorite(String mdName) {
    var i = Hive.box<Favorite>('favorites').get(mdName);
    i!.isFavorite = !i.isFavorite;
    i.save();
    notifyListeners();
  }
}
