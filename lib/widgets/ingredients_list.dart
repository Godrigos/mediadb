import 'package:flutter/material.dart';

import '/models/medium.dart';

class IngredientList extends StatelessWidget {
  final Map<String, Quantity> ingredients;

  const IngredientList({
    super.key,
    required this.ingredients,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ingredients.length,
      itemBuilder: (ctx, index) {
        return ingredients.keys.elementAt(index) != 'volume'
            ? Card(
                color: Colors.green[50],
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 1,
                    horizontal: 10,
                  ),
                  child: Text(
                    '${ingredients.keys.elementAt(index)} = ${ingredients.values.elementAt(index)}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}
