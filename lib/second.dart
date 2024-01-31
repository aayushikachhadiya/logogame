import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: second(),
    debugShowCheckedModeBanner: false,
  ));
}

class second extends StatefulWidget {
  const second({super.key});

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  double dis = 0;
  List<DropdownMenuItem> qty_list = [

    DropdownMenuItem(
      child: Text("1"),
      value: 1,
    ),
    DropdownMenuItem(
      child: Text("2"),
      value: 2,
    ),
    DropdownMenuItem(
      child: Text("3"),
      value: 3,
    ),
    DropdownMenuItem(
      child: Text("4"),
      value: 4,
    ),
    DropdownMenuItem(
      child: Text("5"),
      value: 5,
    ),
  ];
  List<Map> l = [
    {'check': false, 'name': 'computer', 'rate': 1000, 'qty': 1, 'amt': 0},
    {'check': false, 'name': 'Ac', 'rate': 500, 'qty': 1, 'amt': 0},
    {'check': false, 'name': 'remote', 'rate': 300, 'qty': 1, 'amt': 0},
    {'check': false, 'name': 'keybord', 'rate': 2000, 'qty': 1, 'amt': 0},
  ];

  String gender = "";
  dynamic total = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("demo"),
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: l.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Wrap(alignment: WrapAlignment.spaceEvenly, children: [
                    Checkbox(
                      value: l[index]['check'],
                      onChanged: (value) {
                        total = 0;
                        l[index]['check'] = value;
                        if (l[index]['check'] == true) {
                          l[index]['amt'] = l[index]['rate'] * l[index]['qty'];
                        }
                        setState(() {});
                      },
                    ),
                    Text("${l[index]['name']}"),
                    Text("${l[index]['rate']}"),
                    DropdownButton(
                      items: qty_list,
                      value: l[index]['qty'],
                      onChanged: (value) {
                        total = 0;
                        l[index]['qty'] = value;
                        l[index]['amt'] = l[index]['rate'] * l[index]['qty'];
                        setState(() {});
                      },
                    )
                  ]),
                );
              },
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: "male",
                  groupValue: gender,
                  onChanged: (value) {
                    gender = value!;
                    dis = (total / 100) * 5;
                    setState(() {});
                  },
                ),
                Text("male"),
                Radio(
                  value: "female",
                  groupValue: gender,
                  onChanged: (value) {
                    gender = value!;
                    dis = (total / 100) * 10;
                    setState(() {});
                  },
                ),
                Text("female"),
              ],
            ),
            Divider(
              color: Colors.red,
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "item",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  "rate",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Oty",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Amount",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Expanded(
                child: ListView(
              children: l.where((element) => element['check']==true).map((l){
                total+=l['amt'];
                return ListTile(title: Wrap(alignment: WrapAlignment.spaceEvenly,
                  children: [
                    Text("${l['name']}",style: TextStyle(fontSize: 20),),
                    Text("${l['rate']}",style: TextStyle(fontSize: 20),),
                    Text("${l['qty']}",style: TextStyle(fontSize: 20),),
                    Text("${l['amt']}",style: TextStyle(fontSize: 20),),
                  ],
                ),);
              }).toList(),
            )),
            Text("Total=${total}",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            Text("dis=$dis",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            Text("Final=${total - dis}",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          ],
        ));
  }
}
