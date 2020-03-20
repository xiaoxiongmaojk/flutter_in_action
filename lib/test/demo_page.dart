import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterinaction/test/demo_item.dart';

class DemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Colors.blue,
      appBar: new AppBar(
        title: new Text("Title"),
      ),
      body: new ListView.builder(
          itemBuilder: (context, index) {
            return new DemoItem();
          },
        itemCount: 20,
      ),
    );
  }
}
