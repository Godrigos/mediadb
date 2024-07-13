import 'package:flutter/material.dart';

import '/models/medium.dart';

class StepsList extends StatelessWidget {
  final Medium medium;

  const StepsList({super.key, required this.medium});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: medium.steps.length,
      itemBuilder: (ctx, index) {
        return Column(
          children: [
            ListTile(
              dense: true,
              leading: CircleAvatar(
                backgroundColor: Colors.green,
                radius: 15,
                child: Text('${index + 1}'),
              ),
              title: Text(
                medium.steps[index],
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
