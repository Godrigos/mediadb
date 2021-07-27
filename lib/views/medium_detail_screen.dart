import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '/widgets/ingredients_list.dart';
import '/widgets/steps_list.dart';
import '/models/medium.dart';

class MediumDetailScreen extends StatelessWidget {
  Widget _createSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget _createSectionContainer(
    BuildContext context,
    Widget child,
    double height,
    double width,
  ) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final medium = ModalRoute.of(context)!.settings.arguments as Medium;

    String _setMediumState(medium) {
      if (medium.isComplement) {
        return AppLocalizations.of(context)!.complement;
      } else {
        switch (medium.mediumState) {
          case PhysicalState.liquid:
            return AppLocalizations.of(context)!.liquid;

          case PhysicalState.semisolid:
            return AppLocalizations.of(context)!.semisolid;

          case PhysicalState.solid:
            return AppLocalizations.of(context)!.solid;

          default:
            return AppLocalizations.of(context)!.undefined;
        }
      }
    }

    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: Text(medium.initials),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                _createSectionTitle(
                    context, AppLocalizations.of(context)!.ingredients),
                _createSectionContainer(
                  context,
                  IngredientList(medium: medium),
                  MediaQuery.of(context).size.height * 0.25,
                  MediaQuery.of(context).size.width * 0.9,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text('pH: ${medium.pH}'),
                ),
                _createSectionTitle(
                    context, AppLocalizations.of(context)!.preparation),
                _createSectionContainer(
                  context,
                  StepsList(medium: medium),
                  MediaQuery.of(context).size.height * 0.40,
                  MediaQuery.of(context).size.width * 0.9,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: medium.setBGImage(),
                      radius: 16,
                    ),
                    title: Text(
                      _setMediumState(medium),
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                    trailing: Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              if (medium.ps != '')
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text(
                                          AppLocalizations.of(context)!.ps),
                                      content: Text(medium.ps),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                              AppLocalizations.of(context)!
                                                  .close),
                                        ),
                                      ],
                                    );
                                  },
                                );
                            },
                            icon: medium.ps != ''
                                ? Icon(
                                    Icons.info,
                                    color: Colors.green[600],
                                  )
                                : Icon(
                                    Icons.info_outline,
                                    color: Colors.grey,
                                  ),
                          ),
                          IconButton(
                            onPressed: () {
                              if (medium.reference != '')
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text(AppLocalizations.of(context)!
                                          .reference),
                                      content: Text(medium.reference),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                              AppLocalizations.of(context)!
                                                  .close),
                                        ),
                                      ],
                                    );
                                  },
                                );
                            },
                            icon: medium.reference != ''
                                ? Icon(
                                    Icons.article,
                                    color: Colors.green[600],
                                  )
                                : Icon(
                                    Icons.article_outlined,
                                    color: Colors.grey,
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
