import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: one(), debugShowCheckedModeBanner: false,));
}

class one extends StatefulWidget {
  const one({super.key});

  @override
  State<one> createState() => _oneState();
}

class _oneState extends State<one> {
  bool t=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
      body: Column(children: [
        Expanded(child: PageTransitionSwitcher(
          child: (t)?two():three(),
          duration: Duration(seconds: 5),
            transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
              return SharedAxisTransition(animation: primaryAnimation,
                  child: child,
                  secondaryAnimation: secondaryAnimation,
                  transitionType: SharedAxisTransitionType.vertical);
            },
            )),
        ElevatedButton(onPressed: () {
          t=!t;
          setState(() {

          });
        }, child: Text("submit"))
      ]),
    );
  }
}
class two extends StatefulWidget {
  const two({super.key});

  @override
  State<two> createState() => _twoState();
}

class _twoState extends State<two> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Container(
      height: 100,
       width: 100,
      child: Image.asset("myasset/match/coco.png"),
    ),
    );
  }
}
class three extends StatefulWidget {
  const three({super.key});

  @override
  State<three> createState() => _threeState();
}

class _threeState extends State<three> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100,
        width: 100,
        child: Image.asset("myasset/match/caracol.png"),
      ),
    );
  }
}

