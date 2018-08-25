import 'package:flutter/material.dart';

class Task2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          backgroundColor: Colors.white30,
          title: Text('Magical Color Box'),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    'RED',
                    textScaleFactor: 1.2,
                    style: TextStyle(color: Colors.white),
                  ),
                  Text('GREEN',
                      textScaleFactor: 1.2,
                      style: TextStyle(color: Colors.white)),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white30,
                    hintText: 'Write your color',
                    labelText: 'Magical color box',
                    errorText: null),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Task3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Switch(),
            DropdownButton(),
          ],
        ),
      ),
    );
  }
}

class Question extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Material(
          elevation: 8.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Title',
                  style: Theme.of(context)
                      .textTheme
                      .subhead
                      .copyWith(fontSize: 18.0),
                  textAlign: TextAlign.left,
                ),
              ),
              Divider(height: 4.0),
              Flexible(
                child: ListView.builder(
                  itemBuilder: (context, i) {
                    return ListTile(
                      title: Text("Title $i"),
                      subtitle: Text("Subtitle $i"),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        endDrawer: Drawer(
          child: Column(
            children: <Widget>[
              new Text('Notifications',
                  style: new TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Flexible(
                child: ListView(
                  children: List.generate(20, (i)=>ListTile(
                    title: Text('Notification $i'),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
