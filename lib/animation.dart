
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(home: animation(),debugShowCheckedModeBanner: false,));
}
class animation extends StatefulWidget {
  const animation({super.key});

  @override
  State<animation> createState() => _animationState();
}

class _animationState extends State<animation> {
  bool temp=false;
  double h=100;
  double op=0.5;
  double w=100;
  Color c=Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("animation"),
      ),
      body: Column(children: [
        AnimatedOpacity(opacity: op, duration: Duration(seconds: 1),child:
        AnimatedContainer(duration: Duration(seconds: 5),width: w,height: h,color: c,)
        ),
        ElevatedButton(onPressed: () {
          if(temp)
            {
                h=100;
                w=100;
                c=Colors.red;
            }else
              {
                h=200;
                w=200;
                c=Colors.yellow;
              }
          temp=!temp;
          setState(() {

          });
        }, child: Text("submit",style: TextStyle(fontSize: 20),))
      ]),
    );
  }
}
