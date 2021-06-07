import 'package:flutter/material.dart';
import '../utils/app_routes.dart';
import '../models/medium.dart';

class MediumCard extends StatefulWidget {
  final Medium medium;

  const MediumCard({required this.medium});

  @override
  _MediumCardState createState() => _MediumCardState();
}

class _MediumCardState extends State<MediumCard> {
  List<Medium> _favoriteMedium = [];

  bool _isFavorite(Medium medium) {
    return _favoriteMedium.contains(medium);
  }

  void _toggleFavorite(Medium medium) {
    setState(() {
      _favoriteMedium.contains(medium)
          ? _favoriteMedium.remove(medium)
          : _favoriteMedium.add(medium);
    });
  }

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
        trailing: SizedBox(
          width: MediaQuery.of(context).size.width * 0.24,
          child: Row(
            children: [
              IconButton(
                iconSize: 24,
                onPressed: () {},
                color: Theme.of(context).accentColor,
                icon: _isFavorite(widget.medium)
                    ? IconButton(
                        onPressed: () => _toggleFavorite(widget.medium),
                        icon: Icon(Icons.favorite),
                      )
                    : IconButton(
                        onPressed: () => _toggleFavorite(widget.medium),
                        icon: Icon(Icons.favorite_border),
                      ),
              ),
              IconButton(
                iconSize: 24,
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
