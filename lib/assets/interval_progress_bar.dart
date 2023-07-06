
import 'dart:ffi';

import 'package:flutter/material.dart';


class IntervalProgressBar extends StatefulWidget {
  const IntervalProgressBar({Key? key}) : super(key: key);

  @override
  State<IntervalProgressBar> createState() => _IntervalProgressBarState();
}

class _IntervalProgressBarState extends State<IntervalProgressBar> {
      double _progress = 1.0;



  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _intervalBar(),
        _label(),
      ]

    );
  }

  Widget _intervalBar(){
    return  Column(
      children: [
        _interval(customColor: const Color.fromARGB(255, 0, 255, 200)),
        const SizedBox(height: 2.0,),
        _interval(customColor: const Color.fromARGB(255, 0, 255, 136)),
        const SizedBox(height: 2.0,),
        _interval(customColor: const Color.fromARGB(255, 0, 255, 76)),
        const SizedBox(height: 2.0,),
        _interval(customColor: const Color.fromARGB(255, 81, 255, 0)),
        const SizedBox(height: 2.0,),
        _interval(customColor: const Color.fromARGB(255, 166, 255, 0)),
        const SizedBox(height: 2.0,),
        _interval(customColor: const Color.fromARGB(255, 238, 255, 0)),
        const SizedBox(height: 2.0,),
        _interval(customColor: const Color.fromARGB(255, 238, 255, 0)),
        const SizedBox(height: 2.0,),
        _interval(customColor: const Color.fromARGB(255, 255, 102, 0)),
        const SizedBox(height: 2.0,),
        _interval(customColor: const Color.fromARGB(255, 255, 51, 0)),
        const SizedBox(height: 2.0,),
        _interval(customColor: const Color.fromARGB(255, 255, 0, 0)),

        const SizedBox(width: 35.0,),
      ],

    );
  }
  
  Widget _label() {
    return Text(
      _progress.toStringAsFixed(1),
    );
  }

  Widget _interval({required Color customColor}){
    //const Colors color = colors[colorType];
    return SizedBox(
      width: 30.0,
      height: 2.0,
      child:  DecoratedBox(
        //decoration = decoration ?? (color != null ? BoxDecoration(color: color) : null),
        decoration: BoxDecoration(
          color: customColor,
        ),
      ),
    );
  }
  
}