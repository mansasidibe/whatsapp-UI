import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
//          backgroundColor: Color.fromARGB(200, 7, 94, 84),
          backgroundColor: Color.fromRGBO(7, 94, 84, 2),
          title: Text("WhatsApp"),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Icon(Icons.search),
            ),
            Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Icon(Icons.more_vert),
            ),
          ],
//          flexibleSpace: ,
          bottom: TabBar(
            indicatorColor: Colors.white,
            controller: controller,
            tabs: [
              GestureDetector(
                child: Tab(
                  child: Text("CHATS"),
                ),
              ),
              GestureDetector(
                child: Tab(
                  child: Text("STATUS"),
                ),
              ),
              GestureDetector(
                child: Tab(
                  child: Text("CALLS"),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: controller,
          children: [
            Container(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int i) {
                  return Card(
//                    elevation: 10.0,

                    child: ListTile(
                      contentPadding: EdgeInsets.all(10.0),
                      title: Text(
                        "Tidiane $i",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text("Message $i"),
                      leading: CircleAvatar(
                        backgroundColor: Color.fromRGBO(7, 94, 84, 2),
//                        foregroundColor: Colors.pink,
                        child: Icon(Icons.android),
                      ),
                      trailing: Text("${DateTime.now().hour}" +
                          ":" +
                          "${DateTime.now().second}"),
                    ),
                  );
                },
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color.fromRGBO(7, 94, 84, 2),
                      child: Icon(Icons.android),
                    ),
                    title: Text(
                      "My Status",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("Mes statuts"),
                  ),
                  Container(
                    height: 25,
                    color: Colors.black12,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                        ),
                        Text("Recent Updates", textAlign: TextAlign.left),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(0),
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, i) {
                          return Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Color.fromRGBO(7, 94, 84, 2),
                                child: Icon(Icons.android),
                              ),
                              contentPadding: EdgeInsets.all(7.0),
                              title: Text("Hey $i",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              subtitle: Text(
                                  "Aujourd'hui ${DateTime.now().hour}" +
                                      ":" +
                                      "${DateTime.now().minute}" +
                                      "pm"),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int i) {
                  return ListTile(
                    contentPadding: EdgeInsets.all(7.0),
                    leading: CircleAvatar(
                      child: Icon(Icons.android),
                      backgroundColor: Color.fromRGBO(7, 94, 84, 2),
                    ),
                    title: Text("Simple $i",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text("Hier, ${DateTime.now().hour}" +
                        ":" +
                        "${DateTime.now().minute}" +
                        "pm"),
                    trailing: Icon(
                      Icons.call,
                      color: Color.fromRGBO(7, 94, 84, 2),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.camera_alt),
          backgroundColor: Color.fromRGBO(7, 94, 84, 2),
          onPressed: () {},
        ),
      ),
    );
  }
}
