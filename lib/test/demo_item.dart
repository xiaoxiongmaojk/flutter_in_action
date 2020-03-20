import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DemoItem extends StatelessWidget{
  DemoItem() : super();

  _getBottomItem(IconData icon, String text)  {
    return new Expanded(
      flex: 1,
      child: new Center(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Icon(
                icon,
                size: 16.0,
                color: Colors.grey,
            ),
            new Padding(padding: new EdgeInsets.only(left: 5.0)),
            new Text(
              text,
              style: new TextStyle(color: Colors.grey, fontSize: 14.0),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child:new Card(
        child: new FlatButton(
            onPressed: (){print("Press Button");},
            child: new Padding(padding: new EdgeInsets.only(left: 0.0, top: 10.0, right: 10.0, bottom: 10.0),
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Container(
                    child: new Text(
                      "This is a summary",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    margin: new EdgeInsets.only(top: 6.0, bottom: 2.0),
                    alignment: Alignment.topLeft,
                  ),
                  new Padding(padding: EdgeInsets.all(10.0),
                  ),
                  new Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _getBottomItem(Icons.star, "1000"),
                      _getBottomItem(Icons.link, "900"),
                      _getBottomItem(Icons.subject, "1010"),
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }












}