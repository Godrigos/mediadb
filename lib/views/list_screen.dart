// ignore_for_file: library_private_types_in_public_api

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '/widgets/list_Media.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  BannerAd? _ad;
  bool _isLoaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadAd();
  }

  Future<void> _loadAd() async {
    final AnchoredAdaptiveBannerAdSize? size =
        await AdSize.getAnchoredAdaptiveBannerAdSize(
            Orientation.portrait, MediaQuery.of(context).size.width.truncate());

    if (size == null) {
      return;
    }

    _ad = BannerAd(
      adUnitId: 'ca-app-pub-1213028558697902/1573263205',
      size: size,
      request: const AdRequest(
        keywords: <String>[
          'Biotechnology',
          'Microbiology',
          'Science',
          'Laboratory',
          'Research',
          'Education',
        ],
      ),
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          setState(() {
            _ad = ad as BannerAd;
            _isLoaded = true;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          ad.dispose();
        },
      ),
    );
    return _ad!.load();
  }

  @override
  void dispose() {
    _ad?.dispose();
    super.dispose();
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
            if (_ad != null && _isLoaded)
              Container(
                width: _ad!.size.width.toDouble(),
                color: Colors.blueGrey[50],
                height: _ad!.size.height.toDouble(),
                alignment: Alignment.center,
                child: AdWidget(ad: _ad!),
              ),
          ],
        ),
      ),
    );
  }
}
