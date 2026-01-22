import 'package:flutter/material.dart';
import 'app_bar.dart';

List<String> contactName = [];
List<String> contactNumber = [];

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _number = TextEditingController();

  void addContact(String name, String number) {
    setState(() {
      contactName.add(name);
      contactNumber.add(number);
      _name.clear();
      _number.clear();
    });
  }

  void removeContact(int index) {
    setState(() {
      contactName.removeAt(index);
      contactNumber.removeAt(index);
    });
  }

  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: appBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: .center,
          children: [
            Padding(padding: .all(5)),
            SizedBox(
              width: deviceWidth * .95,
              child: Form(
                key: _key,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _name,
                      decoration: InputDecoration(
                        hintText: "Name",
                        contentPadding: .all(5),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "The name field cann't be empty.";
                        }
                        return null;
                      },
                    ),

                    Padding(padding: .only(top: 5)),

                    TextFormField(
                      controller: _number,
                      keyboardType: .number,

                      decoration: InputDecoration(
                        hintText: "Number",
                        contentPadding: .all(5),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "The number cannot be empty.";
                        }
                        return null;
                      },
                    ),

                    Padding(padding: .all(5)),

                    SizedBox(
                      width: deviceWidth * .95,
                      height: deviceHeight * .05,
                      child: FloatingActionButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(10),
                        ),
                        backgroundColor: Colors.blueGrey,
                        onPressed: () {
                          if (_key.currentState!.validate()) {
                            addContact(_name.text, _number.text);
                          }
                        },
                        child: Text(
                          "Add",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(padding: .all(20)),

            Expanded(
              child: SizedBox(
                width: deviceWidth * .9,

                child: ListView.builder(
                  itemCount: contactName.length,
                  itemBuilder: (context, index) => ListTile(
                    onLongPress: () => showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            "Confirmation",
                            style: TextStyle(fontWeight: .bold),
                          ),

                          content: Text("Are you sure for Delete?"),

                          actions: [
                            IconButton(
                              icon: Icon(Icons.cancel, color: Colors.blue),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),

                            IconButton(
                              onPressed: () {
                                removeContact(index);
                                Navigator.of(context).pop();
                              },
                              icon: Icon(Icons.delete, color: Colors.blue),
                            ),
                          ],
                        );
                      },
                    ),

                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Color.fromARGB(26, 135, 125, 125),
                      ),
                      borderRadius: BorderRadiusGeometry.circular(5),
                    ),

                    title: Text(
                      contactName[index],
                      style: TextStyle(color: Colors.red),
                    ),

                    subtitle: Text(contactNumber[index]),

                    leading: Icon(
                      Icons.person,
                      color: const Color.fromARGB(255, 132, 91, 91),
                    ),

                    trailing: Icon(Icons.phone, color: Colors.blue),
                    tileColor: const Color.fromARGB(26, 135, 125, 125),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
