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

        // Open favorites Hivebox
        var box = Hive.box<Favorite>('favorites');
        // Import data from Firestore as a List
        List<QueryDocumentSnapshot<Map<String, dynamic>>> docs =
            media.data!.docs;

        // Create All Media List (no Complementary Solutions)
        List<QueryDocumentSnapshot<Map<String, dynamic>>> allMedia = [];
        // Create Complementary Solutions List
        List<QueryDocumentSnapshot<Map<String, dynamic>>> complement = [];
        docs.forEach(
          (e) {
            if (e.get("isComplement") == false) {
              allMedia.add(e);
            } else {
              complement.add(e);
            }
          },
        );

        // Create Favorites media list
        List<QueryDocumentSnapshot<Map<String, dynamic>>> favorites = [];
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
                  allMedia.isNotEmpty
                      ? Navigator.of(context).pushNamed(
                          AppRoutes.MEDIA_LIST,
                          arguments: {'docs': allMedia, 'list': docs},
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
                  image: AssetImage('assets/icons/all_media.png'),
                ),
              ),
              footer: GridTileBar(
                backgroundColor: Colors.black54,
                title: Text(
                  AppLocalizations.of(context)!.allmedia,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.visible,
                  softWrap: true,
                ),
              ),
            ),
            GridTile(
              child: GestureDetector(
                onTap: () {
                  favorites.isNotEmpty
                      ? Navigator.of(context).pushNamed(
                          AppRoutes.MEDIA_LIST,
                          arguments: {'docs': favorites, 'list': docs},
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
                  overflow: TextOverflow.visible,
                  softWrap: true,
                ),
              ),
            ),
            GridTile(
              child: GestureDetector(
                onTap: () {
                  complement.isNotEmpty
                      ? Navigator.of(context).pushNamed(
                          AppRoutes.MEDIA_LIST,
                          arguments: {'docs': complement, 'list': docs},
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
                  image: AssetImage('assets/icons/becker.png'),
                ),
              ),
              footer: GridTileBar(
                backgroundColor: Colors.black54,
                title: Text(
                  AppLocalizations.of(context)!.complementGrid,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.visible,
                  softWrap: true,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
