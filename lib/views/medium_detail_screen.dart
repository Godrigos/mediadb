// ignore_for_file: library_private_types_in_public_api

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widgets/volume_dialog.dart';
import '/models/medium.dart';
import '../widgets/list_Media.dart';
import '/widgets/ingredients_list.dart';
import '/widgets/steps_list.dart';

class MediumDetailScreen extends StatefulWidget {
  const MediumDetailScreen({super.key});

  @override
  _MediumDetailScreenState createState() => _MediumDetailScreenState();
}

class _MediumDetailScreenState extends State<MediumDetailScreen> {
  Widget _createSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
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
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return VolumeDialog(medium: medium);
                },
                barrierDismissible: false,
              );
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
                  IngredientList(ingredients: medium.ingredients),
                  MediaQuery.of(context).size.height * 0.25,
                  MediaQuery.of(context).size.width * 0.90,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Column(
                    children: [
                      Text(
                        'Volume: ${medium.ingredients['volume']}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green[600],
                        ),
                      ),
                      Text(
                        'pH: ${medium.pH}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green[600],
                        ),
                      ),
                    ],
                  ),
                ),
                _createSectionTitle(
                    context, AppLocalizations.of(context)!.preparation),
                _createSectionContainer(
                  context,
                  StepsList(medium: medium),
                  MediaQuery.of(context).size.height * 0.38,
                  MediaQuery.of(context).size.width * 0.90,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          if (medium.use.isNotEmpty) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title:
                                      Text(AppLocalizations.of(context)!.use),
                                  content: Text(medium.use),
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
                          }
                        },
                        icon: Image.asset(
                          medium.setBGImage().assetName,
                          width: 22,
                          height: 22,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          if (medium.ps.isNotEmpty) {
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
                          }
                        },
                        icon: medium.ps.isNotEmpty
                            ? Icon(
                                Icons.info,
                                color: medium.caution
                                    ? Colors.red[600]
                                    : Colors.green[600],
                              )
                            : const Icon(
                                Icons.info_outline,
                                color: Colors.grey,
                              ),
                      ),
                      IconButton(
                        onPressed: () {
                          if (medium.reference.isNotEmpty) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                      AppLocalizations.of(context)!.reference),
                                  content: SelectableText(medium.reference),
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
                          }
                        },
                        icon: medium.reference.isNotEmpty
                            ? Icon(
                                Icons.article,
                                color: Colors.green[600],
                              )
                            : const Icon(
                                Icons.article_outlined,
                                color: Colors.grey,
                              ),
                      ),
                    ],
                  ),
                ),
                if (medium.complement.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      AppLocalizations.of(context)!.complementList,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                if (medium.complement.isNotEmpty)
                  SingleChildScrollView(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Flexible(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.90,
                              child: listMedia(
                                list: docs,
                                docs: docs
                                    .where(
                                      (e) => medium.complement
                                          .contains(e.get('initials')),
                                    )
                                    .toList(),
                              ),
                            ),
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
