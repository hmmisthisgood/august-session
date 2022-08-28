import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key, this.screenTitle = "app"}) : super(key: key);
  final String screenTitle;

  @override
  State<StatefulWidget> createState() {
    return _CounterScreenState();
  }
}

class _CounterScreenState extends State<CounterScreen> {
  int count = 0;
  int b = 10;

  @override
  initState() {
    super.initState();
    print("Init called");
    count = 0;

    /// used for initializing or starting expeesnsive tasks
    ///
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose called");
  }

  @override
  void didUpdateWidget(covariant CounterScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("did update called");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print("Build function callled");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.screenTitle),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          count++;

          setState(() {});

          print("updated count:  $count");
        },
      ),
      body: Center(
          child: Text(
        "I am pressed $count times",
        style: TextStyle(fontSize: 30),
      )),
    );
  }
}
