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
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 5,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/becker.png',
                      height: 35,
                      width: 35,
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          AppLocalizations.of(context)!.complement,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 5,
                  right: 5,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/erlenmeyer.png',
                      height: 35,
                      width: 35,
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          AppLocalizations.of(context)!.liquid,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 5,
                  right: 5,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/petridish_semisolid.png',
                      height: 35,
                      width: 35,
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          AppLocalizations.of(context)!.semisolid,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 5,
                  right: 5,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/petridish_solid.png',
                      height: 35,
                      width: 35,
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          AppLocalizations.of(context)!.solid,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 5,
                  right: 5,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/petridish.png',
                      height: 35,
                      width: 35,
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          AppLocalizations.of(context)!.undefined,
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
