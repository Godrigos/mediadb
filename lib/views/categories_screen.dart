import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '/utils/app_routes.dart';
import '/models/favorite.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('media')
          .orderBy('initials')
          .snapshots(),
      builder: (BuildContext ctx,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> media) {
        if (media.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        var box = Hive.box<Favorite>('favorites');
        List<QueryDocumentSnapshot<Map<String, dynamic>>> favorites = [];
        List<QueryDocumentSnapshot<Map<String, dynamic>>> docs =
            media.data!.docs;
        docs.forEach(
          (e) {
            if (box.get(e.get('initials')) == null) {
              box.put(
                e.get('initials'),
                Favorite(
                  initials: e.get('initials'),
                  isFavorite: false,
                ),
              );
            }
            if (box.get(e.get('initials'))!.isFavorite) favorites.add(e);
          },
        );

        return GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 30,
            mainAxisSpacing: 30,
          ),
          padding: const EdgeInsets.all(30),
          children: [
            GridTile(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.MEDIA_LIST,
                    arguments: docs,
                  );
                },
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/icons/all_media.png'),
                ),
              ),
              footer: GridTileBar(
                backgroundColor: Colors.black54,
                title: Text(
                  AppLocalizations.of(context)!.allmedia,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            GridTile(
              child: GestureDetector(
                onTap: () {
                  favorites.isNotEmpty
                      ? Navigator.of(context).pushNamed(
                          AppRoutes.MEDIA_LIST,
                          arguments: favorites,
                        )
                      : ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: const Duration(seconds: 2),
                            content:
                                Text(AppLocalizations.of(context)!.nothing),
                          ),
                        );
                },
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/icons/favorite.png'),
                ),
              ),
              footer: GridTileBar(
                backgroundColor: Colors.black54,
                title: Text(
                  AppLocalizations.of(context)!.favorite,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
