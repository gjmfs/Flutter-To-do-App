import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainAppState();
  }
}

class MainAppState extends State<MainApp> {
  List<String> task = [];

  @override
  Widget build(BuildContext context) {
    TextEditingController inputBox1 = TextEditingController();
    return (MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 82, 28, 25),
          title: Text("To-do App", style: TextStyle(color: Colors.white)),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: inputBox1,
                      decoration: InputDecoration(
                        label: Text("Enter a task"),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                MaterialButton(
                  color: Colors.white,
                  height: 50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onPressed: () {
                    setState(() {
                      if (inputBox1.text.isNotEmpty) {
                        task.add(inputBox1.text);
                      }
                    });
                  },
                  child: Text("+"),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: task.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          spreadRadius: 2,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(task[index]),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: MaterialButton(
                            onPressed: () {
                              setState(() {
                                task.removeAt(index);
                              });
                            },

                            child: Icon(Icons.delete, color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
