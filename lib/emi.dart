import 'dart:math';

import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(home: emi(),debugShowCheckedModeBanner: false,));
}
class emi extends StatefulWidget {
  const emi({super.key});

  @override
  State<emi> createState() => _emiState();
}

class _emiState extends State<emi> {
  double a = 100000.0;
  double a1 = 1;
  double a2 = 1;
  double min = 100000.0;
  double max = 20000000.0;
  double min1 = 1;
  double max1 = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Emi caluctation"),backgroundColor: Colors.green,),
    body: Column(children: [
      Container(
        margin: EdgeInsets.all(10),
        child: TextField(decoration: InputDecoration(
          border: OutlineInputBorder(),
          label: Text("Home Loan Amount  ${a.toInt()}",style: TextStyle(fontSize: 20),)
        ),),
      ),
      Container(
        child: Slider(
          activeColor: Colors.red,
          min: 100000.0,
          max: 20000000.0,
         // divisions: (max - min) ~/ 100000.0,
          value: a,
          onChanged: (value) {
            a = value;
            setState(() {});
          },
        ),
      ),
      Container(
        margin: EdgeInsets.all(10),
        child: TextField(decoration: InputDecoration(
            border: OutlineInputBorder(),
            label: Text("Interest Rate  ${a1.toInt()}",style: TextStyle(fontSize: 20),)
        ),),
      ),
      Container(
        child: Slider(
          activeColor: Colors.red,
          min: 1,
          max: 20,
          divisions: (max - min) ~/5,
          value: a1,
          onChanged: (value) {
            a1= value;
            setState(() {});
          },
        ),
      ),
      Container(
        margin: EdgeInsets.all(10),
        child: TextField(decoration: InputDecoration(
            border: OutlineInputBorder(),
            label: Text("Loan Tenure  ${a2.toInt()}",style: TextStyle(fontSize: 20),)
        ),),
      ),
      Container(
        child: Slider(
          activeColor: Colors.red,
          min: 1,
          max: 20,
         // divisions: (max - min) ~/5,
          value: a2,
          onChanged: (value) {
            a2= value;
            setState(() {});
          },
        ),
      ),
      Expanded(child:Container(child: Text("Total=${a.toInt()*a1.toInt()}",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),))
    ]),
    );
  }
}
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   int _divisionCount = 40;
//   double _sliderValue = 0.0;
//
//   void _updateSliderValue(int division) {
//     setState(() {
//       _sliderValue = division * 0.25;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Slider Example'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Slider(
//                 value: _sliderValue,
//                 onChanged: (newValue) {
//                   int division = (newValue / 0.25).round();
//                   _updateSliderValue(division);
//                 },
//                 min: 0,
//                 max: _divisionCount.toDouble(),
//                 divisions: _divisionCount,
//                 label: _sliderValue.toStringAsFixed(2),
//               ),
//               Text('Slider Value: ${_sliderValue.toStringAsFixed(2)}'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
