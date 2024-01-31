import 'package:demo/animation.dart';
import 'package:demo/hero_a.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: hero(),
    debugShowCheckedModeBanner: false,
  ));
}

class hero extends StatefulWidget {
  const hero({super.key});

  @override
  State<hero> createState() => _heroState();
}

class _heroState extends State<hero> {
  List image=["myasset/match/barco.png","myasset/match/ajo.png","myasset/match/bellota.png",];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("hero animation")),
      body: GridView.builder(
        itemCount: image.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
      mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ), itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(context, hero_a(second(image[index])));
          },
          child: Hero(tag: "${image[index]}",
          child: Container(
            height:100,
            width: 100,
            child: Image.asset("${image[index]}"),
          ),)
        );
      },)
    );
  }
}
class second extends StatefulWidget {
String iamge;
second(this.iamge);
  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
    body: Hero(tag: "${widget.iamge}",child: Container(
      height: 100,
      width: 100,
      child: Image.asset("${widget.iamge}"),
    ),)
    );
  }
}

