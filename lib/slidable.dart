import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void main() {
  runApp(MaterialApp(
    home: sildable(),
    debugShowCheckedModeBanner: false,
  ));
}

class sildable extends StatefulWidget {
  const sildable({super.key});

  @override
  State<sildable> createState() => _sildableState();
}

class _sildableState extends State<sildable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SlidableAction"),),
      // body: ListView.builder(itemCount: 5,
      //   itemBuilder: (context, index) {
      //     return Dismissible(key:UniqueKey(), child: Card(child: Slidable(
      //         // endActionPane: ActionPane(motion: ScrollMotion(), children: [
      //         //   SlidableAction(
      //         //     label: "Update",
      //         //     backgroundColor: Colors.pink,
      //         //     onPressed: (BuildContext context) {},
      //         //   ),
      //         //   SlidableAction(
      //         //     label: "Delete",
      //         //     backgroundColor: Colors.yellow,
      //         //     onPressed: (BuildContext context) {
      //         //     },
      //         //   ),
      //         // ]),
      //         startActionPane: ActionPane(motion: BehindMotion(),children: [
      //           SlidableAction(
      //             label: "Update",
      //             backgroundColor: Colors.pink,
      //             onPressed: (BuildContext context) {},
      //           ),
      //           SlidableAction(
      //             label: "Delete",
      //             backgroundColor: Colors.yellow,
      //             onPressed: (BuildContext context) {},
      //           )
      //         ]),
      //         child: ListTile(
      //           title: Text("heloo"),
      //         )),));
      //   },
      // ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Dismissible(key: UniqueKey(), child: Card(
            child: ListTile(
              title: Text("${index+1}"),
            ),
          ));
        },),
    );

  }
}
