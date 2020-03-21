import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



enum TabType { bottom, top }

class TabWidget extends StatefulWidget {
  final TabType type;
  final List<Widget> tabItems;
  final List<Widget> tabViews;
  final Color indicatorColor;
  final Widget title;
  final PageController pageController;
  final ValueChanged<int> onPageChanged;
  final ValueChanged<int> onTap;
  final int initTabIndex;

  TabWidget({
    Key key,
    this.type = TabType.top,
    this.tabItems,
    this.tabViews,
    this.indicatorColor = Colors.green,
    this.title,
    this.initTabIndex = 0,
    this.pageController,
    this.onPageChanged,
    this.onTap,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => new _TabBarState();
}

class _TabBarState extends State<TabWidget> with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(
        vsync: this,
        length: widget.tabItems.length,
        initialIndex: widget.initTabIndex
    );
    _pageController = widget.pageController;
    _pageController ??= PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  Widget _getBottomNavByType() {
    return new Material(
      color: Colors.black,
      child: new Container(
        decoration: BoxDecoration(
          border: Border(
            top: Divider.createBorderSide(context, color: Colors.grey),
          ),
        ),
        child: new SafeArea(
            child: Theme(
              data: Theme.of(context).copyWith(
                splashColor: Colors.transparent
              ),
              child: new TabBar(
                controller: _tabController,
                labelPadding: EdgeInsets.zero,
                tabs: widget.tabItems,
                indicatorColor: widget.indicatorColor,
                onTap: (index) {
                  _pageController.animateToPage(
                      index,
                      duration: Duration(milliseconds: 200),
                      curve: Curves.linear);
                  if(widget.onTap != null){
                    widget.onTap(index);
                  }
                },
              ),
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(widget.type == TabType.top) {
      return new Scaffold(
//      drawer: _drawer,
//      floatingActionButton: _floationActionButton,
        appBar: new AppBar(
          title: widget.title,
          bottom: new TabBar(
            controller: _tabController,
            tabs: widget.tabItems,
            indicatorColor: widget.indicatorColor,
          ),
        ),
        body: new TabBarView(
          controller: _tabController,
          children: widget.tabViews,
        ),
      );
    }

    return new Scaffold(
      appBar: new AppBar(
        title: widget.title,
      ),
      body: new PageView(
        controller: _pageController,
        children: widget.tabViews,
        onPageChanged: (index) {
          if(!_tabController.indexIsChanging) {
            _tabController.animateTo(
              index,
              curve: Curves.linear,
              duration: Duration(milliseconds: 20)
            );
          }
          widget.onPageChanged?.call(index);

        },
      ),
      bottomNavigationBar: _getBottomNavByType(),
    );
  }
}

class TabBarWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _TabBarState();
  }
}