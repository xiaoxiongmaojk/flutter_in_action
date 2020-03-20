
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class _TabBarState extends State<TabBarWidget> with SingleTickerProviderStateMixin{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: _tabItems.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}

class TabBarWidget  extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }
}