import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class hero_a extends PageRoute
{
  Widget second;
  hero_a(this.second);
  @override
  // TODO: implement barrierColor
  Color? get barrierColor => Colors.red;

  @override
  // TODO: implement barrierLabel
  String? get barrierLabel => "Testing";

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    // TODO: implement buildPage
   return FadeTransition(opacity: animation,child: second,);
  }

  @override
  // TODO: implement maintainState
  bool get maintainState =>true;

  @override
  // TODO: implement transitionDuration
  Duration get transitionDuration =>Duration(seconds: 5);

}