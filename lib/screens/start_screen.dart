import 'package:flutter/material.dart';
import 'package:wear_counter_app_1/assets/interval_progress_bar.dart';
import 'package:intl/intl.dart';
import 'package:wear_counter_app_1/screens/drink_screen.dart';
// import 'dart:async';
// import 'package:shared_preferences/shared_preferences.dart';

class StartScreen extends StatefulWidget {
  final double hidratacion;
  final int valueWater;
  const StartScreen({Key? key, required this.hidratacion, required this.valueWater}) : super(key: key);
  final int totalValue = 2550;
  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  get valueWater => widget.valueWater;
  get totalValue => widget.totalValue;
  get hidratacion => widget.hidratacion;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 16,
        leadingWidth: 100,
        leading: Text(
              "Water Counter",
              style: Theme.of(context).textTheme.bodyMedium,
        ),
        actions: [
          _hour()
        ],
        // actions: [],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _totalMl(),
          _verticalGap(),
          _indicators(),
          _verticalGap(),
          _buttonReg()
        ],
      ),
    );
  }

  Widget _totalMl(){
    return Column(
      children: [
        Text(
          valueWater.toString(),
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Text(
          'Faltan ${totalValue - valueWater <= 0 ? 0 : totalValue - valueWater} ml',
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }

  Widget _indicators(){
    return IntrinsicHeight(
      child: 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            _percentage(),
            _smallDivider(),
            _hydration(),
          ],
        ),
    );
  }

  Widget _percentage(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircularProgressIndicator(
                strokeWidth: 6,
                value: valueWater * 100 / totalValue / 100,
                color: const Color.fromARGB(255, 106, 255, 7),
                backgroundColor: const Color.fromARGB(58, 88, 88, 88),    
              ),
              Text(
                '${valueWater * 100 ~/ totalValue >= 100 ? 100 : valueWater * 100 ~/ totalValue}%',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          )
        ),
        Text(
          DateTime.now().toString().split(' ')[0],
          style: Theme.of(context).textTheme.bodySmall,
        )
      ],
    );
  }

  Widget _smallDivider(){
    return const VerticalDivider(
      color: Color.fromARGB(255, 0, 253, 13),
      width: 20,
      thickness: 1,
      indent: 10,
      endIndent: 0,
    );
  }

  Widget _hydration(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IntervalProgressBar(value: hidratacion),
        // _intervalBar(),
        Text(
          'Hidratación',
          style: Theme.of(context).textTheme.bodySmall,
        )
      ],
    );
  }

  // ignore: unused_element
  Widget _intervalBar(){
    return Text(
            '1.0',
            style: Theme.of(context).textTheme.headlineSmall,
          );
  }

  Widget _hour() {
    return Text(
      DateFormat.Hm().format(DateTime.now()),
      style: Theme.of(context).textTheme.bodySmall,
    );
  }

  Widget _verticalGap() {
    return const SizedBox(
      height: 5.5,
    );
  }

  Widget _buttonReg(){
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints.tightFor(
          width: 100,
          height: 30,
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
            ),
            backgroundColor: const Color.fromARGB(255, 31, 15, 175),
          ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DrinkScreen(hidratacion: hidratacion,valueWater: valueWater,)),
              );
            },
            child: 
              const Text(
                'Registrar',
              )
          ),
      )
      );
  }
}
