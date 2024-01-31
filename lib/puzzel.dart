import 'package:flutter/material.dart';
import 'package:demo/level.dart';
import 'package:demo/math.dart';
import 'package:demo/math1.dart';

class puzeel extends StatefulWidget {
  List ?l;
  puzeel([this.l]);

  @override
  State<puzeel> createState() => _puzeelState();
}

class _puzeelState extends State<puzeel> {
  int levelno=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }
  get()
  {
    levelno=math.prefs!.getInt("level_no")??0;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WillPopScope(child: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("myasset/math/background.jpg"),
              ),
            ),
            child: Column(children: [
              Expanded(
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                            alignment: Alignment.center, child: Text("Select Puzzel",
                              style: TextStyle(fontSize: 30, color: Colors.blue)),
                          )),
                    ],
                  )),
              Expanded(
                  flex: 5,
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                            child: GridView.builder(
                              itemCount: 24,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  mainAxisSpacing: 5,
                                  crossAxisSpacing: 5),
                              itemBuilder: (context, index) {
                                return InkWell(onTap: () {

                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return math1(index,true);
                                  },));
                                },
                                  child: Container(
                                    alignment: Alignment.center,
                                    child:(index<levelno) ? Text(
                                      "${index+1}",
                                      style: TextStyle(fontSize: 40,fontFamily: "two"),
                                    ) : null,
                                    decoration: BoxDecoration(
                                      image: (index<levelno) ? (widget.l![index]=="yes") ? DecorationImage(
                                          image: AssetImage("myasset/math/tick.png")) : null : DecorationImage(
                                          image: AssetImage("myasset/math/lock.png")),
                                      borderRadius: (index<levelno)?BorderRadius.circular(10):null,
                                      border:(index<levelno)? Border.all(width: 3):null,
                                    ),
                                  ),
                                );
                              },
                            ),
                          )),
                    ],
                  )),
              Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(flex: 2, child: Text("")),
                      Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return level1(widget.l);
                                },
                              ));
                            },
                            child: Container(
                              child: Image(image: AssetImage("myasset/math/next.png")),
                            ),
                          )),
                    ],
                  )),
            ]),
          ),
        ),onWillPop: () async{
          showDialog(context: context, builder: (context) {
            return AlertDialog(title: Text("are you sure exit"),
              actions: [
                TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return math();
                  },));
                }, child: Text("YES")),
                TextButton(onPressed: () {
                  Navigator.pop(context);
                }, child: Text("No"))
              ],
            );
          },);
          return true;

        },));
  }
}
class level1 extends StatefulWidget {
  List? l;
  level1([this.l]);
  @override
  State<level1> createState() => _level1State();
}

class _level1State extends State<level1> {
  int levelno=24;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }
  get()
  {
    levelno=math.prefs!.getInt("levelno")??0;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("myasset/math/background.jpg"),
              ),
            ),
            child: Column(children: [
              Expanded(
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: Text("Select Puzzel1",
                                style: TextStyle(fontSize: 30, color: Colors.blue)),
                          )),
                    ],
                  )),
              Expanded(
                  flex: 5,
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                            child: GridView.builder(
                              itemCount: 24,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  mainAxisSpacing: 5,
                                  crossAxisSpacing: 5),
                              itemBuilder: (context, index) {
                                return InkWell(onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return math1();

                                  },));
                                },
                                  child: Container(
                                    alignment: Alignment.center,
                                    child:(index+24<levelno)
                                        ?Text(
                                      "${index+25}",
                                      style: TextStyle(fontSize: 40,fontFamily: "two"),
                                    ):null,
                                    decoration: BoxDecoration(
                                      image: (index+24<levelno)
                                          ?(widget.l?[index+24]=="YES")?DecorationImage(
                                          image: AssetImage("myasset/math/tick.png")):null
                                          :DecorationImage(
                                          image: AssetImage("myasset/math/lock.png")),
                                      borderRadius: (index+24<levelno)?BorderRadius.circular(10):null,
                                      border:(index+24<levelno)? Border.all(width: 3):null,
                                    ),
                                  ),
                                );
                              },
                            ),
                          )),
                    ],
                  )),
              Expanded(
                  child: Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return puzeel(widget.l);
                                },
                              ));
                            },
                            child: Container(
                              height: double.infinity,
                              width: double.infinity,
                              child: Image(image: AssetImage("myasset/math/back.png")),
                            ),
                          )),
                      Expanded(flex: 3,child: Text("")),
                      Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return level2(widget.l);
                                },
                              ));
                            },
                            child: Container( height: double.infinity,
                              width: double.infinity,
                              child: Image(image: AssetImage("myasset/math/next.png")),
                            ),
                          )),

                    ],
                  )),
            ]),
          ),
        ));
  }
}
class level2 extends StatefulWidget {
  List? l;
  level2([this.l]);

  @override
  State<level2> createState() => _level2State();
}

class _level2State extends State<level2> {
  int levelno=24;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }
  get()
  {
    levelno=math.prefs!.getInt("levelno")??0;
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("myasset/math/background.jpg"),
              ),
            ),
            child: Column(children: [
              Expanded(
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: Text("Select Puzzel2",
                                style: TextStyle(fontSize: 30, color: Colors.blue)),
                          )),
                    ],
                  )),
              Expanded(
                  flex: 5,
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                            child: GridView.builder(
                              itemCount: 24,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  mainAxisSpacing: 5,
                                  crossAxisSpacing: 5),
                              itemBuilder: (context, index) {
                                return InkWell(onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return math1();

                                  },));
                                },
                                  child: Container(
                                    alignment: Alignment.center,
                                    child:(index+24<levelno)
                                        ?Text(
                                      "${index+25}",
                                      style: TextStyle(fontSize: 40,fontFamily: "two"),
                                    ):null,
                                    decoration: BoxDecoration(
                                      image: (index+24<levelno)
                                          ?(widget.l?[index+24]=="YES")?DecorationImage(
                                          image: AssetImage("myasset/math/tick.png")):null
                                          :DecorationImage(
                                          image: AssetImage("myasset/math/lock.png")),
                                      borderRadius: (index+24<levelno)?BorderRadius.circular(10):null,
                                      border:(index+24<levelno)? Border.all(width: 3):null,
                                    ),
                                  ),
                                );
                              },
                            ),
                          )),
                    ],
                  )),
              Expanded(
                  child: Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return level1(widget.l);
                                },
                              ));
                            },
                            child: Container(
                              height: double.infinity,
                              width: double.infinity,
                              child: Image(image: AssetImage("myasset/math/back.png")),
                            ),
                          )),
                      Expanded(flex: 3,child: Text("")),
                      Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return level2(widget.l);
                                },
                              ));
                            },
                            child: Container( height: double.infinity,
                              width: double.infinity,
                              child: Image(image: AssetImage("myasset/math/next.png")),
                            ),
                          )),

                    ],
                  )),
            ]),
          ),
        )
    );
  }
}
