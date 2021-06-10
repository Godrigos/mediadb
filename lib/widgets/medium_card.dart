import 'package:flutter/material.dart';
import '../utils/app_routes.dart';
import '../models/medium.dart';

class MediumCard extends StatelessWidget {
  final Medium medium;

  const MediumCard({required this.medium});

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
            arguments: medium,
          );
        },
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: medium.setBGImage(),
          radius: 25,
        ),
        title: Text(
          medium.initials,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(medium.longName),
      ),
    );
  }
}
