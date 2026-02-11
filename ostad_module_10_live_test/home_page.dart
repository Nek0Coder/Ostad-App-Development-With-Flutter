import 'package:flutter/material.dart';
import 'package:ostad_module_10_live_test/app_bar.dart';

List<String> employeeName = [];
List<String> employeeAge = [];
List<String> employeeSalary = [];

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _salary = TextEditingController();

  void addContact(String name, String age, String salary) {
    setState(() {
      employeeName.add(name);
      employeeAge.add(age);
      employeeSalary.add(salary);
      _name.clear();
      _age.clear();
      _salary.clear();
    });
  }

  void removeEmployee(int index) {
    setState(() {
      employeeName.removeAt(index);
      employeeAge.removeAt(index);
      employeeSalary.removeAt(index);
    });
  }

  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: appBar(deviceHeight),
      body: Center(
        child: Column(
          crossAxisAlignment: .center,
          children: [
            Padding(padding: .all(10)),
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
                        hintStyle: TextStyle(fontSize: 20, color: Colors.black),
                        contentPadding: .all(5),
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
                      keyboardType: .number,
                      controller: _age,

                      decoration: InputDecoration(
                        hintText: "Age",
                        hintStyle: TextStyle(fontSize: 20, color: Colors.black),
                        contentPadding: .all(5),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "The age field cann't be empty.";
                        }
                        return null;
                      },
                    ),

                    Padding(padding: .all(5)),

                    TextFormField(
                      controller: _salary,
                      keyboardType: .number,
                      decoration: InputDecoration(
                        hintText: "Salary",
                        hintStyle: TextStyle(fontSize: 20, color: Colors.black),
                        contentPadding: .all(5),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "The salary field cann't be empty.";
                        }
                        return null;
                      },
                    ),

                    Padding(padding: .all(5)),

                    ElevatedButton(
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          addContact(_name.text, _age.text, _salary.text);
                        }
                      },
                      child: Text(
                        "Add Employee",
                        style: TextStyle(color: Colors.deepPurple),
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
                  itemCount: employeeName.length,
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
                                removeEmployee(index);
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
                      employeeName[index],
                      style: TextStyle(color: Colors.red),
                    ),

                    subtitle: Text(
                      " Age: ${employeeAge[index]} Salary: ${employeeSalary[index]}",
                    ),

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
