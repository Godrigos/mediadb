import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

customDialog(BuildContext context, GlobalKey<FormState> formKey) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      var multiplierController = TextEditingController();
      return AlertDialog(
        title: Text(AppLocalizations.of(context)!.volume),
        content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
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
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: AppLocalizations.of(context)!.volume,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          ElevatedButton(
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
        actionsPadding: const EdgeInsets.only(right: 30.0),
      );
    },
  );
}
