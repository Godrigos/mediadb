import 'package:flutter/material.dart';
import '../widgets/ingredients_list.dart';
import '../widgets/steps_list.dart';
import '../models/medium.dart';

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
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final medium = ModalRoute.of(context)!.settings.arguments as Medium;

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
                _createSectionTitle(context, 'Ingredientes'),
                _createSectionContainer(
                  context,
                  IngredientList(medium: medium),
                  MediaQuery.of(context).size.height * 0.25,
                  MediaQuery.of(context).size.width * 0.85,
                ),
                _createSectionTitle(context, 'Preparo'),
                _createSectionContainer(
                  context,
                  StepsList(medium: medium),
                  MediaQuery.of(context).size.height * 0.43,
                  MediaQuery.of(context).size.width * 0.85,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: medium.setBGImage(),
                      radius: 20,
                    ),
                    title: Text(
                      medium.setMediumState(),
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                    trailing: medium.ps != ''
                        ? IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Observação'),
                                    content: Text(medium.ps),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Fechar'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            icon: Icon(
                              Icons.info,
                              color: Colors.blue,
                            ),
                          )
                        : null,
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
