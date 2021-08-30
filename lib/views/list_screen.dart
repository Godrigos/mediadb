import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '/widgets/list_Media.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  late BannerAd _ad;

  @override
  void initState() {
    super.initState();

    _ad = BannerAd(
      adUnitId: 'ca-app-pub-1213028558697902/1573263205',
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {});
        },
        onAdFailedToLoad: (ad, error) {
          // Releases an ad resource when it fails to load
          ad.dispose();
        },
      ),
    );
    _ad.load();
  }

  @override
  void dispose() {
    super.dispose();
    _ad.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context)!.settings.arguments as Map;
    final List<QueryDocumentSnapshot<Map<String, dynamic>>> docs = args['docs'];
    final List<QueryDocumentSnapshot<Map<String, dynamic>>> list = args['list'];
    final String catTitle = args['title'];

    return Scaffold(
      appBar: AppBar(
        title: Text(catTitle),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: listMedia(docs: docs, list: list),
            ),
            if (_ad.responseInfo != null)
              Container(
                child: AdWidget(ad: _ad),
                width: MediaQuery.of(context).size.width,
                color: Colors.green[50],
                height: 72.0,
                alignment: Alignment.center,
              ),
          ],
        ),
      ),
    );
  }
}
