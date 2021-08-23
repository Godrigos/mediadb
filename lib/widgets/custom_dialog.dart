import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomDialog extends StatefulWidget {
  final formKey;

  CustomDialog({
    required this.formKey,
  });

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  TextEditingController multiplierController = TextEditingController();
  String _chosenUnit = 'L';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context)!.volume),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          Form(
            key: widget.formKey,
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
                  controller: multiplierController,
                  keyboardType: TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.12,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _chosenUnit,
                items: <String>[
                  'L',
                  'mL',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _chosenUnit = value!;
                  });
                },
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
          onPressed: () {
            if (multiplierController.text.isNotEmpty) {
              print(
                double.parse(multiplierController.text),
              );
            }
            Navigator.of(context).pop();
          },
        ),
      ],
      buttonPadding: const EdgeInsets.all(0),
      actionsPadding: const EdgeInsets.only(right: 20),
    );
  }
}
