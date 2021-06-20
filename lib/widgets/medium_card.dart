import 'package:flutter/material.dart';

import '/utils/app_routes.dart';
import '/models/medium.dart';

class MediumCard extends StatefulWidget {
  final Medium medium;

  const MediumCard({required this.medium});

  @override
  _MediumCardState createState() => _MediumCardState();
}

class _MediumCardState extends State<MediumCard> {
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
            arguments: widget.medium,
          );
        },
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: widget.medium.setBGImage(),
          radius: 25,
        ),
        title: Text(
          widget.medium.initials,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(widget.medium.longName),
        trailing: IconButton(
          onPressed: () {
            setState(() {
              widget.medium.toggleFavorite();
            });
          },
          icon: widget.medium.isFavorite
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
