// ignore_for_file: library_private_types_in_public_api

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '/models/medium.dart';
import '/utils/parseFirestoreMedia.dart';
import '/models/favorite.dart';
import '/utils/app_routes.dart';

class MediumCard extends StatefulWidget {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> docs;
  final int i;
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> list;

  const MediumCard({
    super.key,
    required this.docs,
    required this.i,
    required this.list,
  });

  @override
  _MediumCardState createState() => _MediumCardState();
}

class _MediumCardState extends State<MediumCard> {
  late Medium medium;

  @override
  void initState() {
    super.initState();
    medium = parseFirestoreMedia(widget.docs[widget.i]);
  }

  var box = Hive.box<Favorite>('favorites');

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 3,
      ),
      child: ListTile(
        onTap: () {
          Navigator.of(context).pushNamed(
            AppRoutes.MEDIUM_DETAIL,
            arguments: {
              'medium': medium,
              'list': widget.list,
            },
          );
        },
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: medium.setBGImage(),
          radius: 25,
        ),
        title: Text(
          medium.initials,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(medium.longName),
        trailing: IconButton(
          onPressed: () {
            setState(() {
              box.get(medium.initials)?.toggleFavorite(medium.initials);
            });
          },
          icon: box.get(medium.initials)!.isFavorite
              ? const Icon(
                  Icons.favorite,
                  color: Colors.redAccent,
                )
              : const Icon(
                  Icons.favorite_outline,
                  color: Colors.redAccent,
                ),
        ),
      ),
    );
  }
}
