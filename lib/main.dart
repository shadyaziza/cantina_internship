import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import './tasks/task2.dart';
import './tasks/task4.dart';

void main() => runApp(new DatePickerTask());

class StateModel extends Model {
  int _counter = 0;
  int get counter => _counter;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: StateModel(),
      child: new MaterialApp(
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new MyHomePage(title: 'Flutter Demo Home Page'),
        title: 'Flutter Demo',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButton: FAB(),
      appBar: new AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => PageTwo(),
                  ),
                ),
          ),
        ],
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            ScopedModelDescendant(
              // rebuildOnChange: ,
              builder: (_, __, StateModel stateModel) {
                return new Text(
                  '${stateModel.counter}',
                  style: Theme.of(context).textTheme.display1,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FAB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      rebuildOnChange: false,
      builder: (BuildContext context, _, StateModel stateModel) {
        return FloatingActionButton(
          onPressed: stateModel.incrementCounter,
          tooltip: 'Increment',
          child: new Icon(Icons.add),
        );
      },
    );
  }
}

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => PageThree(),
                  ),
                ),
          ),
        ],
        title: Text('Page Two'),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child:  ScopedModelDescendant(
              // rebuildOnChange: ,
              builder: (_, __, StateModel stateModel) {
                return new Text(
                  '${stateModel.counter}',
                  style: Theme.of(context).textTheme.display1,
                );
              },
            ),
      ),
    );
  }
}

class PageThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Three'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Center(
        child:  ScopedModelDescendant(
              // rebuildOnChange: ,
              builder: (_, __, StateModel stateModel) {
                return new Text(
                  '${stateModel.counter}',
                  style: Theme.of(context).textTheme.display1,
                );
              },
            ),
      ),
    );
  }
}
