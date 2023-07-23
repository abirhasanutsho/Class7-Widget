import 'package:flutter/material.dart';

import 'SecondScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> dataList = [
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5",
    "Item 6",
    "Item 7",
  ];

  String? selectedValue;

  bool checkboxValue = false;
  bool checkboxValue2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
            child: Padding(
          padding: EdgeInsets.only(top: 60),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.red,
                radius: 50,
              ),
              Text("Abir Hasan"),
              ElevatedButton(onPressed: () {}, child: Text("Save")),

              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SecondScreen()));
                },
                leading: Icon(Icons.home),
                title: Text("Home Screen"),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SecondScreen()));
                },
                child: Text("Second Page"),
              ),

              // ListTile(
              //   leading: Icon(Icons.home),
              //   title: Text("Second Page"),
              // ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Third Page"),
              ),

              //  Expan tion Tile,

              ExpansionTile(
                expandedAlignment: Alignment.center,
                title: Text("Abir Hasan"),
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Rakib"),
                      Text("Sakib"),
                      Text("Abid"),
                      ListTile(
                        leading: Icon(Icons.home),
                        title: Text("Third Page"),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        )),
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          elevation: 10,
          title: Text(
            "Home Screen",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Drop Down Button,

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton(
                  hint: Text("Select your Item"),
                  isExpanded: true,
                  items: dataList.map((value) {
                    return DropdownMenuItem(
                      child: Text(value.toString()),
                      value: value.toString(),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                  value: selectedValue,
                ),
              ),
              SizedBox(
                height: 30,
              ),

              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: Text("Checkbox"),
                value: checkboxValue,
                onChanged: (bool? value) {
                  setState(() {
                    checkboxValue = value!;
                  });
                },
              ),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: Text("Checkbox 2"),
                value: checkboxValue2,
                onChanged: (bool? value) {
                  setState(() {
                    checkboxValue2 = value!;
                  });
                },
              ),

              Row(
                children: [
                  Text("CheckBox 3"),
                  Checkbox(
                      value: checkboxValue,
                      onChanged: (bool? value) {
                        setState(() {
                          checkboxValue = value!;
                        });
                      }),
                ],
              )
            ],
          ),
        ));
  }
}
