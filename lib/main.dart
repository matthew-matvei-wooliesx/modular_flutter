import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:modular_flutter/application/incrementer.dart';

void main() async {
  await initialiseDataLayer();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int? _counter;
  final Incrementer _incrementer;

  _MyHomePageState() : _incrementer = Incrementer.poorMansProvider();

  @override
  void initState() {
    super.initState();

    _incrementer
        .getCurrent()
        .then((value) => value ?? 0)
        .then((initialValue) => setState(() {
              _counter = initialValue;
            }));
  }

  void _incrementCounter() async {
    final incrementedValue = await _incrementer.increment();
    setState(() {
      _counter = incrementedValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
