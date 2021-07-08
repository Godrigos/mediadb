import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '/utils/app_routes.dart';
import '/models/medium.dart';

class MediumCard extends StatefulWidget {
  final int mdKey;

  const MediumCard({required this.mdKey});

  @override
  _MediumCardState createState() => _MediumCardState();
}

class _MediumCardState extends State<MediumCard> {
  var box = Hive.box<Medium>('media');

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
            arguments: box.get(widget.mdKey),
          );
        },
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: box.get(widget.mdKey)?.setBGImage(),
          radius: 25,
        ),
        title: Text(
          box.get(widget.mdKey)!.initials,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(box.get(widget.mdKey)!.longName),
        trailing: IconButton(
          onPressed: () {
            setState(() {
              box.get(widget.mdKey)?.toggleFavorite(widget.mdKey);
            });
          },
          icon: box.get(widget.mdKey)!.isFavorite
              ? Icon(
                  Icons.favorite,
                  color: Colors.redAccent,
                )
              : Icon(
                  Icons.favorite_outline,
                  color: Colors.redAccent,
                ),
        ),
      ),
    );
  }
}
