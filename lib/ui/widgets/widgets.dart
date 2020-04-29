import 'package:flutter/material.dart';

class ItemRow extends StatelessWidget {
  final String itemName;
  final String itemInfo;

  // const ItemRow({Key key, this.itemName, this.itemInfo}) : super(key: key);

  ItemRow(this.itemName, this.itemInfo);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          TempImageWidget(),
          Expanded(
            child: Text(
              itemName,
              
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  fontSize: 30.0,color: Colors.black87,
                  decoration: TextDecoration.none,
                  fontFamily: 'Sunflower',
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(
              itemInfo,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  fontSize: 16.0,color: Colors.black45,
                  decoration: TextDecoration.none,
                  fontFamily: 'Sunflower',
                  fontWeight: FontWeight.normal),
            ),
          ),
          AddButton(itemName, itemInfo),
        ],
      ),
    );
  }
}

class TempImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //AssetImage asset = AssetImage('images/supermarket.png');
    Image img = Image.asset(
      'images/supermarket.png',
      width: 24.0,
      height: 24.0,
    );
    return Container(
      child: img,
    );
  }
}

class AddButton extends StatelessWidget {
  final String itemName;
  final String itemInfo;

  AddButton(this.itemName, this.itemInfo);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 12),
        child: RaisedButton(
          child: Text("Add to cart",style: TextStyle(fontSize: 12.0),),
          color: Colors.black,
          textColor: Colors.amberAccent,
          elevation: 4.0,
          onPressed: () {
            addToCart(context);
          },
        ));
  }

  void addToCart(BuildContext context) {
    var alert = AlertDialog(
      title: Text("$itemName added to Order"),
      content: Text("Item details\n$itemInfo"),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }
}
