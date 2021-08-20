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
        // Create Favorites media list
        List<QueryDocumentSnapshot<Map<String, dynamic>>> favorites = [];
        // Create Bacteria media list
        List<QueryDocumentSnapshot<Map<String, dynamic>>> bacteria = [];
        // Create Fungi media list
        List<QueryDocumentSnapshot<Map<String, dynamic>>> fungi = [];
        // Create Microalgae media list
        List<QueryDocumentSnapshot<Map<String, dynamic>>> microalgae = [];

        docs.forEach(
          (e) {
            // Evaluate complementary solution entry
            if (e.data().containsKey('isComplement') &&
                e.get("isComplement") == true) {
              complement.add(e);
            } else {
              allMedia.add(e);
            }
            // Evaluate favorite entry
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
            // Evaluate organism entry
            if (e.data().containsKey('organism') &&
                e.get('organism').contains('Bacteria')) {
              bacteria.add(e);
            }
            if (e.data().containsKey('organism') &&
                e.get('organism').contains('Fungi')) {
              fungi.add(e);
            }
            if (e.data().containsKey('organism') &&
                e.get('organism').contains('Microalgae')) {
              microalgae.add(e);
            }
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
            // All Media Grid Tile
            GridTile(
              child: GestureDetector(
                onTap: () {
                  allMedia.isNotEmpty
                      ? Navigator.of(context).pushNamed(
                          AppRoutes.MEDIA_LIST,
                          arguments: {
                            'docs': allMedia,
                            'list': docs,
                            'title': AppLocalizations.of(context)!.allmedia,
                          },
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
            // Favorites Grid Tile
            GridTile(
              child: GestureDetector(
                onTap: () {
                  favorites.isNotEmpty
                      ? Navigator.of(context).pushNamed(
                          AppRoutes.MEDIA_LIST,
                          arguments: {
                            'docs': favorites,
                            'list': docs,
                            'title': AppLocalizations.of(context)!.favorite,
                          },
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
            // Bacteria Media Grid Tile
            GridTile(
              child: GestureDetector(
                onTap: () {
                  bacteria.isNotEmpty
                      ? Navigator.of(context).pushNamed(
                          AppRoutes.MEDIA_LIST,
                          arguments: {
                            'docs': bacteria,
                            'list': docs,
                            'title': 'Bacteria',
                          },
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
                  image: AssetImage('assets/icons/bacteria.png'),
                ),
              ),
              footer: GridTileBar(
                backgroundColor: Colors.black54,
                title: Text(
                  'Bacteria',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.visible,
                  softWrap: true,
                ),
              ),
            ),
            // Fungi Media Grid Tile
            GridTile(
              child: GestureDetector(
                onTap: () {
                  fungi.isNotEmpty
                      ? Navigator.of(context).pushNamed(
                          AppRoutes.MEDIA_LIST,
                          arguments: {
                            'docs': fungi,
                            'list': docs,
                            'title': 'Fungi',
                          },
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
                  image: AssetImage('assets/icons/fungi.png'),
                ),
              ),
              footer: GridTileBar(
                backgroundColor: Colors.black54,
                title: Text(
                  'Fungi',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.visible,
                  softWrap: true,
                ),
              ),
            ),
            // Microalgae Grid Tile
            GridTile(
              child: GestureDetector(
                onTap: () {
                  microalgae.isNotEmpty
                      ? Navigator.of(context).pushNamed(
                          AppRoutes.MEDIA_LIST,
                          arguments: {
                            'docs': microalgae,
                            'list': docs,
                            'title': 'Microalgae',
                          },
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
                  image: AssetImage('assets/icons/microalgae.png'),
                ),
              ),
              footer: GridTileBar(
                backgroundColor: Colors.black54,
                title: Text(
                  'Microalgae',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.visible,
                  softWrap: true,
                ),
              ),
            ),
            // Complementary Solutions Grid Tile
            GridTile(
              child: GestureDetector(
                onTap: () {
                  complement.isNotEmpty
                      ? Navigator.of(context).pushNamed(
                          AppRoutes.MEDIA_LIST,
                          arguments: {
                            'docs': complement,
                            'list': docs,
                            'title':
                                AppLocalizations.of(context)!.complementGrid,
                          },
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
