import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: dismissble(), debugShowCheckedModeBanner: false,));
}

class dismissble extends StatefulWidget {
  const dismissble({super.key});

  @override
  State<dismissble> createState() => _dismissbleState();
}

class _dismissbleState extends State<dismissble> {
  List l=["1","2","3","4","5"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
      body: ListView.builder(itemCount: l.length,itemBuilder: (context, index) {
        return Dismissible(key: UniqueKey(),child: Card(child: ListTile(
          title: Text("${l[index]}"),
        ),));
      },)
    );
  }
}
