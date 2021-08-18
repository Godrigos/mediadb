import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mediadb/widgets/list_Media.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final docs = ModalRoute.of(context)!.settings.arguments
        as List<QueryDocumentSnapshot<Map<String, dynamic>>>;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appTitle),
      ),
      body: SafeArea(
        child: listMedia(docs: docs),
      ),
    );
  }
}
