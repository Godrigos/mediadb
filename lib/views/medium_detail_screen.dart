import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '/utils/custom_dialog.dart';
import '/models/medium.dart';
import '../widgets/list_Media.dart';
import '/widgets/ingredients_list.dart';
import '/widgets/steps_list.dart';

class MediumDetailScreen extends StatefulWidget {
  @override
  _MediumDetailScreenState createState() => _MediumDetailScreenState();
}

class _MediumDetailScreenState extends State<MediumDetailScreen> {
  final _formKey = GlobalKey<FormState>();

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
    final Map args = ModalRoute.of(context)!.settings.arguments as Map;
    final Medium medium = args['medium'];
    final List<QueryDocumentSnapshot<Map<String, dynamic>>> docs = args['list'];

    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: Text(medium.initials),
        actions: [
          IconButton(
            onPressed: () {
              customDialog(context, _formKey);
            },
            icon: const Icon(Icons.calculate_rounded),
          )
        ],
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
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        medium.setBGImage().assetName,
                        height: 22,
                        width: 22,
                      ),
                      IconButton(
                        onPressed: () {
                          if (medium.ps != '')
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(AppLocalizations.of(context)!.ps),
                                  content: Text(medium.ps),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                          AppLocalizations.of(context)!.close),
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
                                  title: Text(
                                      AppLocalizations.of(context)!.reference),
                                  content: Text(medium.reference),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                          AppLocalizations.of(context)!.close),
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
                if (medium.complement.isNotEmpty)
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      AppLocalizations.of(context)!.complementList,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                if (medium.complement.isNotEmpty)
                  SingleChildScrollView(
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: listMedia(
                              docs: docs
                                  .where(
                                    (e) => medium.complement
                                        .contains(e.get('initials')),
                                  )
                                  .toList(),
                            ),
                            height: MediaQuery.of(context).size.height * 0.15,
                            width: MediaQuery.of(context).size.width * 0.9,
                          )
                        ],
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
