import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DrinkScreen extends StatelessWidget {
  const DrinkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 16,
        leadingWidth: 100,
        leading: Text(
          "Cancelar",
          style: Theme.of(context).textTheme.bodySmall,
        ),
        actions: [
          _hour(context),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          _oneCard(context),
          _oneCard(context),
          _oneCard(context),
          _oneCard(context),
        ]
      ),
    );
  }

  Widget _oneCard(BuildContext context){
    return const Card(
      elevation: 10,
      color: Color.fromARGB(255, 216, 40, 9),
      child: Text(
        'Esta es una targeta',
      ),
    );
  }

  Widget _hour(BuildContext context) {
    return Text(
      DateFormat.Hm().format(DateTime.now()),
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}