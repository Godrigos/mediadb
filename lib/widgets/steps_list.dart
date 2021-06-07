import 'package:flutter/material.dart';
import '../models/medium.dart';

class StepsList extends StatelessWidget {
  final Medium medium;

  const StepsList({required this.medium});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: medium.steps.length,
      itemBuilder: (ctx, index) {
        return Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                child: Text('${index + 1}'),
              ),
              title: Text(
                '${medium.steps[index]}',
                style: TextStyle(
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
