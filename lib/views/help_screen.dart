import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.help),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.95,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 3),
                child: Text(
                  AppLocalizations.of(context)!.helpIcons,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: ExactAssetImage(
                    'assets/icons/becker.png',
                    scale: 1,
                  ),
                  radius: 18,
                ),
                title: Text(AppLocalizations.of(context)!.complement),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: ExactAssetImage(
                    'assets/icons/erlenmeyer.png',
                    scale: 1,
                  ),
                  radius: 18,
                ),
                title: Text(AppLocalizations.of(context)!.liquid),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: ExactAssetImage(
                    'assets/icons/petridish_semisolid.png',
                    scale: 1,
                  ),
                  radius: 18,
                ),
                title: Text(AppLocalizations.of(context)!.semisolid),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: ExactAssetImage(
                    'assets/icons/petridish_solid.png',
                    scale: 1,
                  ),
                  radius: 18,
                ),
                title: Text(AppLocalizations.of(context)!.solid),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
