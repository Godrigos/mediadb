import 'package:flutter/material.dart';
import '../models/medium.dart';

class IngredientList extends StatelessWidget {
  final Medium medium;

  const IngredientList({required this.medium});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: medium.ingredients.length,
      itemBuilder: (ctx, index) {
        return Card(
          color: Colors.blue[50],
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 1,
              horizontal: 10,
            ),
            child: Text(
              '${medium.ingredients.keys.elementAt(index)} = ' +
                  '${medium.ingredients.values.elementAt(index).toString()}',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        );
      },
    );
  }
}
