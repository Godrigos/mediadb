import '/data/media.dart';
import 'medium.dart';

class MediaList {
  List<Medium> _mediaList = [...media];

  List<Medium> get favoriteItems {
    return _mediaList.where((element) => element.isFavorite).toList();
  }

  List<Medium> get nonFavoriteItems {
    return _mediaList.where((element) => !element.isFavorite).toList();
  }

  List<Medium> sortList() {
    favoriteItems.sort(
        (a, b) => a.initials.toLowerCase().compareTo(b.initials.toLowerCase()));
    nonFavoriteItems.sort(
        (a, b) => a.initials.toLowerCase().compareTo(b.initials.toLowerCase()));
    return favoriteItems + nonFavoriteItems;
  }
}
