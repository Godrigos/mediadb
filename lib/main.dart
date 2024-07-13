import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'firebase_options.dart';

import '/views/categories_screen.dart';
import '/views/help_screen.dart';
import '/views/list_screen.dart';
import 'models/favorite.dart';
import 'utils/app_routes.dart';
import 'views/medium_detail_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  await MobileAds.instance.initialize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  Hive.registerAdapter(FavoriteAdapter());
  await Hive.openBox<Favorite>('favorites');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Culture Media DB',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('pt', 'BR'), // Brazilian Portuguese
      ],
      theme: ThemeData(
        primarySwatch: Colors.green,
        colorScheme: ThemeData.light(useMaterial3: true).colorScheme.copyWith(
              secondary: Colors.greenAccent,
              primary: Colors.green[600],
            ),
        fontFamily: 'RobotoCondensed',
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              labelLarge: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
        appBarTheme: const AppBarTheme(
          color: Colors.green,
          titleTextStyle: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const MyHomePage(),
      routes: {
        AppRoutes.MEDIUM_DETAIL: (ctx) => const MediumDetailScreen(),
        AppRoutes.MEDIA_LIST: (ctx) => const ListScreen(),
        AppRoutes.HELP: (ctx) => const HelpScreen(),
        AppRoutes.MEDIA_CATEGORIES: (ctx) => const CategoriesScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
      body: const SafeArea(
        child: CategoriesScreen(),
      ),
    );
  }
}
