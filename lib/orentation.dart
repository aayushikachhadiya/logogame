import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    home: orentation(),
    debugShowCheckedModeBanner: false,
  ));
}

class orentation extends StatefulWidget {
  const orentation({super.key});

  @override
  State<orentation> createState() => _orentationState();
}

class _orentationState extends State<orentation> {
  bool t = true;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        print(orientation);
        if (Orientation.portrait == orientation) {
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
              overlays: SystemUiOverlay.values);
          t = true;
        } else {
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
              overlays: [SystemUiOverlay.bottom]);
          t = false;
        }
        return Scaffold(
          appBar: (t) ? AppBar() : null,
          body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: (t) ? 3 : 5,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5),
            itemBuilder: (context, index) {
              return Container(
                height: 100,
                width: 100,
                color: Colors.yellow,
              );
            },
          ),
        );
      },
    );
  }
}
//icon change karva mate
//D:\andriod\demo\android\app\src\main\res
//name change karva mate
//android\app\src\main\AndroidManifest.xml
