import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '/views/categories_screen.dart';
import '/views/help_screen.dart';
import '/views/list_screen.dart';
import 'models/favorite.dart';
import 'utils/app_routes.dart';
import 'views/medium_detail_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(FavoriteAdapter());
  await Hive.openBox<Favorite>('favorites');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Culture Media DB',
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''), // English, no country code
        const Locale('pt', 'BR'), // Brazilian Portuguese
      ],
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Colors.green[600],
        accentColor: Colors.greenAccent,
        fontFamily: 'RobotoCondensed',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              button: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: const TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
      home: MyHomePage(),
      routes: {
        AppRoutes.MEDIUM_DETAIL: (ctx) => MediumDetailScreen(),
        AppRoutes.MEDIA_LIST: (ctx) => ListScreen(),
        AppRoutes.HELP: (ctx) => HelpScreen(),
        AppRoutes.MEDIA_CATEGORIES: (ctx) => CategoriesScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appTitle),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.HELP);
            },
            icon: const Icon(Icons.help_outline),
          )
        ],
      ),
      body: SafeArea(
        child: CategoriesScreen(),
      ),
    );
  }
}
