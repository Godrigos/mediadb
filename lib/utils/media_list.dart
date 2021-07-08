import 'package:hive/hive.dart';

import '../models/medium.dart';

List<Medium> mediaList() {
  var box = Hive.box<Medium>('media');

  List<Medium> favoriteItems() {
    List<Medium> list = [];
    box.values.forEach((element) {
      if (element.isFavorite == true) list.add(element);
    });
    return list;
  }

  List<Medium> nonFavoriteItems() {
    List<Medium> list = [];
    box.values.forEach((element) {
      if (element.isFavorite == false) list.add(element);
    });
    return list;
  }

  var favorite = favoriteItems();
  var notFavorite = nonFavoriteItems();

  favorite.sort(
      (a, b) => a.initials.toLowerCase().compareTo(b.initials.toLowerCase()));
  notFavorite.sort(
      (a, b) => a.initials.toLowerCase().compareTo(b.initials.toLowerCase()));
  return favorite + notFavorite;
}
