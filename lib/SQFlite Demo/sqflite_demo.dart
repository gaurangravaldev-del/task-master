import 'package:flutter/material.dart';
import 'package:task/SQFlite%20Demo/db.dart';
import 'package:task/SQFlite%20Demo/user_data.dart';

class SqfliteDemo extends StatefulWidget {
  const SqfliteDemo({super.key});

  @override
  State<SqfliteDemo> createState() => _SqfliteDemoState();
}

class _SqfliteDemoState extends State<SqfliteDemo> {
  late MyDB db = MyDB();

  List<Map> slist = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    db.Open();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SQFlite Demo'), centerTitle: true),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UserData()),
          ).then((_) {
            getData();
          });
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: slist.length,
        itemBuilder: (context, index) {
          var stuone = slist[index];
          return Card(
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text('${stuone["name"]} ${stuone["surname"]}'),
              subtitle: Text(stuone["email"]),
            ),
          );
        },
      ),
    );
  }

  void getData() async {
    print("Fetching data...");
    var data = await db.db.rawQuery("SELECT * FROM students");
    print("Fetched Data: $data");
    slist = data;
    setState(() {});
  }
}
