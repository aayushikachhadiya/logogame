import 'package:demo/page_transtion_enimation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'drwaer_tabe.dart';

void main() {
  runApp(MaterialApp(
    home: dynamic1(),
    debugShowCheckedModeBanner: false,
  ));
}

class dynamic1 extends StatefulWidget {
  const dynamic1({super.key});

  @override
  State<dynamic1> createState() => _dynamic1State();
}

class _dynamic1State extends State<dynamic1> with TickerProviderStateMixin {
  TabController? tabController;
  int cur_tab = 0;
  List str = ["one", "two", "three", "four", "five"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(
        initialIndex: cur_tab,
        animationDuration: Duration(seconds: 1),
        length: 5,
        vsync: this);
    tabController?.addListener(() {
      cur_tab = tabController!.index;
      setState(() {});
    });
  }

  List<Widget> tab_class = [one1(),two1(), Three1(), four(), five()];
  List<Widget> tab_icon = [
    Icon(Icons.home),
    Icon(Icons.account_balance_outlined),
    Icon(Icons.camera),
    Icon(Icons.alarm),
    Icon(Icons.search),
  ];

  @override
  Widget build(BuildContext ontext) {
    return Scaffold(
      drawer: Drawer(
        child: Column(children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: Icon(Icons.supervised_user_circle_sharp),
            accountName: Text("Ayushi Kachhadiya"),
            accountEmail: Text("ayushikachhadiya23@gamil.com"),
          ),
          Column(children:   str.map((e) {
            int ind = str.indexOf(e);
            return    ListTile(
              onTap: () {
                cur_tab = ind;
                tabController!.animateTo(cur_tab);
                Navigator.pop(context);
                setState(() {});
              },
              title: Text("$e"),
            );
          }).toList(),),

        ]),
      ),
      appBar: AppBar(
        title: Text(""),
        actions: [
          IconButton(
              onPressed: () {
                print("hello");
              },
              icon: Icon(Icons.search)),
          PopupMenuButton(
            itemBuilder: (context) =>
                str.map((e) {
                  int ind = str.indexOf(e);
                  return   PopupMenuItem(
                    onTap: () {
                      cur_tab = ind;
                      tabController!.animateTo(cur_tab);
                      setState(() {});
                    },
                    child: Text("$e"),
                    value: 1,
                  );
                }).toList(),
          )
        ],
        bottom: TabBar(
            onTap: (value) {
              cur_tab = value;
              setState(() {});
            },
            isScrollable: true,
            dividerColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.white,
            controller: tabController,
            tabs: str.map((e) {
              int ind = str.indexOf(e);
              return Tab(
                child: Text("${e}"),
                icon: tab_icon[ind],
              );
            }).toList()),
      ),
      body: TabBarView(controller: tabController, children: tab_class),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: cur_tab,
        onTap: (value) {
          cur_tab = value;
          tabController!.animateTo(cur_tab);
          setState(() {});
        },
        items: str.map((e) {
          int ind = str.indexOf(e);
          return BottomNavigationBarItem(
            icon: tab_icon[ind],
            backgroundColor: Colors.black,
            label: "$e",
          );
        }).toList(),
      ),
    );
  }
}
