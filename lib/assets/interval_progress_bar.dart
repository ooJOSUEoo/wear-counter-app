import 'package:flutter/material.dart';


class IntervalProgressBar extends StatefulWidget {
  final double value;
  const IntervalProgressBar({Key? key, required this.value}) : super(key: key);

  @override
  State<IntervalProgressBar> createState() => _IntervalProgressBarState();
}

class _IntervalProgressBarState extends State<IntervalProgressBar> {
  double get value => widget.value;
    List<Color> darkColors = [
      const Color.fromARGB(87, 0, 107, 84),
      const Color.fromARGB(83, 1, 100, 54),
      const Color.fromARGB(88, 0, 95, 29),
      const Color.fromARGB(94, 28, 87, 1),
      const Color.fromARGB(101, 57, 87, 1),
      const Color.fromARGB(111, 81, 87, 0),
      const Color.fromARGB(87, 82, 82, 0),
      const Color.fromARGB(82, 85, 58, 1),
      const Color.fromARGB(97, 85, 34, 0),
      const Color.fromARGB(83, 90, 0, 0),
    ];
    List<Color> brightColors = [
      const Color.fromARGB(255, 0, 255, 200),
      const Color.fromARGB(255, 0, 255, 136),
      const Color.fromARGB(255, 0, 255, 76),
      const Color.fromARGB(255, 81, 255, 0),
      const Color.fromARGB(255, 166, 255, 0),
      const Color.fromARGB(255, 238, 255, 0),
      const Color.fromARGB(255, 255, 255, 0),
      const Color.fromARGB(255, 255, 174, 0),
      const Color.fromARGB(255, 255, 102, 0),
      const Color.fromARGB(255, 255, 0, 0),
  ];


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _intervalBar(),
        _label(),
      ]

    );
  }

  Widget _intervalBar(){
    List<Color> actualColors = [];

    if(value == 0){
      actualColors = darkColors;
    }else{
      for (int i = 0; i < brightColors.length; i++) {
        if(10/value <= i.toDouble()){
          actualColors.add(brightColors[i]);
        }else{
          actualColors.add(darkColors[i]);
        }
      }
    }
    if(value >= 5){
      actualColors = brightColors;
    }

    return  Column(
      children: [
        _interval(customColor: actualColors[0] ),
        _separator(),
        _interval(customColor: actualColors[1]),
        _separator(),
        _interval(customColor: actualColors[2]),
        _separator(),
        _interval(customColor: actualColors[3]),
        _separator(), 
        _interval(customColor: actualColors[4]),
        _separator(),
        _interval(customColor: actualColors[5]),
        _separator(),
        _interval(customColor: actualColors[6]),
        _separator(),
        _interval(customColor: actualColors[7]),
        _separator(),
        _interval(customColor: actualColors[8]),
        _separator(),
        _interval(customColor: actualColors[9]),
        

        const SizedBox(width: 35.0,),
      ],

    );
  }
  
  Widget _label() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          '${value >= 5 ? 5 : value.toStringAsFixed(1)}',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }

  Widget _separator(){
    return const SizedBox(
          height: 2.2,
        );
  }

  Widget _interval({required Color customColor}){
    //const Colors color = colors[colorType];
    return SizedBox(
      width: 15.0,
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