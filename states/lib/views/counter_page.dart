import 'package:flutter/material.dart';

class CounterPage  extends StatefulWidget {
  const CounterPage ({super.key});

  @override
  State<CounterPage> createState() => _State();
}

class _State extends State<CounterPage> {

  //var
  int _counter = 0;

  //method
  void _incrementCounter(){
    //setState Rebuild tje widget
    setState(() {
      _counter ++;

    });
  }

  //UI (USer interface)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("You pushed the button this many times :",
          style: TextStyle(fontSize: 20),)),
          Center(child: Text(_counter.toString() ,
          style: TextStyle(fontSize: 25),)),
          ElevatedButton(onPressed: _incrementCounter, child: Text("Increment!!"))
        ],
      ),
    );
  }
}
