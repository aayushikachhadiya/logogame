import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: animation(), debugShowCheckedModeBanner: false,));
}

class animation extends StatefulWidget {
  const animation({super.key});

  @override
  State<animation> createState() => _animationState();
}

class _animationState extends State<animation> {
  List images=["caracol.png","cono.png","galleta.png"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(itemCount: images.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 5),
        itemBuilder: (context, index) {
          return OpenContainer(
            middleColor: Colors.pink,
            transitionDuration: Duration(seconds: 5),
            transitionType: ContainerTransitionType.fadeThrough,
            closedBuilder: (context, action) {
              return Container(
                height: 100,
                width: 100,
                child: Image.asset("myasset/match/${images[index]}"),
              );
          }, openBuilder: (context, action) {
              return second(images[index]);
          },);
        },),
    );
  }
}
class second extends StatefulWidget {
String ?images;
second([this.images]);
  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
      body: Container(
        height: 100,
        width: 100,
        child: Image.asset("myasset/match/${widget.images}"),
      ),
    );
  }
}

