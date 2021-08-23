import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '/widgets/ingredients_list.dart';
import '/models/medium.dart';

class VolumeDialog extends StatefulWidget {
  final Medium medium;

  VolumeDialog({
    required this.medium,
  });

  @override
  _VolumeDialogState createState() => _VolumeDialogState();
}

class _VolumeDialogState extends State<VolumeDialog> {
  TextEditingController _multiplierController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      buttonPadding: const EdgeInsets.all(0),
      actionsPadding: const EdgeInsets.only(right: 20),
      title: Text(AppLocalizations.of(context)!.volume),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          Form(
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                child: TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r'(^[0-9]*(\.[0-9]{0,2})?)'),
                    ),
                  ],
                  controller: _multiplierController,
                  keyboardType: TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.1,
            child: Text(
              widget.medium.ingredients['dH₂O']!.unit,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          child: Text(AppLocalizations.of(context)!.exit),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text(AppLocalizations.of(context)!.calculate),
          onPressed: () async {
            if (_multiplierController.text.isNotEmpty) {
              IngredientList(
                ingredients: multiply(
                  widget.medium.ingredients,
                  double.parse(_multiplierController.text),
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: const Duration(seconds: 2),
                  content: Text(
                    AppLocalizations.of(context)!.updatedVolume,
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              );
            }
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
