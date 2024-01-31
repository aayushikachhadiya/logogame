import 'package:demo/data_image.dart';
import 'package:demo/logo2.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'logo1.dart';
import 'logo4.dart';

class logo3 extends StatefulWidget {
int? index;
logo3([this.index]);

  @override
  State<logo3> createState() => _logo3State();
}

class _logo3State extends State<logo3> {
  List im=[];
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    switch(widget.index)
        {
      case 0:
        {
          im=data_image.level1;
          break;
        }
      case 1:
        {
          im=data_image.level2;
          break;
        }
      case 2:
        {
          im=data_image.level3;
          break;
        }
      case 3:
        {
          im=data_image.level4;
          break;
        }
      case 4:
        {
          im=data_image.level5;
          break;
        }
      case 5:
        {
          im=data_image.level6;
          break;
        }
      case 6:
        {
          im=data_image.level7;
          break;
        }

    }

  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: Scaffold(
        appBar: AppBar(
          title: Text("${data_image.level[widget.index!]}"),
          backgroundColor: Colors.indigo,
        ),
        body: GridView.builder(itemCount: im.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 5, crossAxisSpacing: 5),
          itemBuilder: (context, index) {
            String win=logo1.prefs!.getString("Wins$index")??"";
            return InkWell(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                  return logo4(index,im);
                },));
              },
              child: Container(
                  height: 100,
                  width: 100,
                  // color: (win=="pass")?Colors.red:Colors.white,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("myasset/logo/${im[index]}")),
                  ),
                  child: (win=="pass")?Image.asset("myasset/logo/abc_btn_check_to_on_mtrl_015.png"):null
              ),
            );
          },
        )), onWillPop:() async{
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return logo2();
        },
      ));
         return true ;
        } ,);
  }
}
