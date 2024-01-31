import 'package:demo/page_transtion_enimation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: drawer(),
    debugShowCheckedModeBanner: false,
  ));
}

class drawer extends StatefulWidget {
  const drawer({super.key});

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  bool t=false;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 7, child: Scaffold(
      appBar: AppBar(
        title: Text(""),
        actions: [
          IconButton(
              onPressed: () {
                print("hello");
              },
              icon: Icon(Icons.search)),
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text("One"),
                value: 1,
              ),
              PopupMenuItem(
                child: Text("Two"),
                value: 2,
              ),
              PopupMenuItem(
                child: Text("Three"),
                value: 3,
              )
            ],
          )
        ],
        bottom: TabBar(isScrollable: true,
          dividerColor: Colors.black,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.white,

          tabs: [
          Tab(child: Text("One"),),
          Tab(child: Text("Two"),),
          Tab(child: Text("Three"),),
          Tab(child: Text("four"),),
          Tab(child: Text("five"),),
          Tab(child: Text("six"),),
          Tab(child: Text("sevan"),),
        ],),
      ),
      body: TabBarView(children: [
        one1(),
        two1(),
        Three1(),
        four(),
        five(),
        six(),
        seven(),
      ]),
    ));
  }
}

class one1 extends StatefulWidget {
  const one1({super.key});

  @override
  _one1State createState() => _one1State();
}

class _one1State extends State<one1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.red,
      child: Text("One"),
    );
  }
}

class two1 extends StatefulWidget {
  const two1({super.key});

  @override
  State<two1> createState() => _two1State();
}

class _two1State extends State<two1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.red,
      child: Text("Two"),
    );
  }
}

class Three1 extends StatefulWidget {
  const Three1({super.key});

  @override
  State<Three1> createState() => _Three1State();
}


class _Three1State extends State<Three1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.red,
      child: Text("Three"),
    );
  }
}

class four extends StatefulWidget {
  const four({super.key});

  @override
  State<four> createState() => _fourState();
}

class _fourState extends State<four> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.red,
      child: Text("Four"),
    );
  }
}

class five extends StatefulWidget {
  const five({super.key});

  @override
  State<five> createState() => _fiveState();
}

class _fiveState extends State<five> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.red,
      child: Text("Five"),
    );
  }
}

class six extends StatefulWidget {
  const six({super.key});

  @override
  State<six> createState() => _sixState();
}

class _sixState extends State<six> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.red,
      child: Text("Six"),
    );
  }
}

class seven extends StatefulWidget {
  const seven({super.key});

  @override
  State<seven> createState() => _sevenState();
}

class _sevenState extends State<seven> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.red,
      child: Text("seven"),
    );
  }
}
