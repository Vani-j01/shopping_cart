import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List picked = [false, false];

  int totalAmount = 0;

  pickToggle(index) {
    setState(() {
      picked[index] = !picked[index];
      getTotalAmount();
    });
  }

  getTotalAmount() {
    var count = 0;
    for (int i = 0; i < picked.length; i++) {
      if (picked[i]) {
        count = count + 1;
      }
      if (i == picked.length - 1) {
        setState(() {
          totalAmount = 250 * count;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(shrinkWrap: true, children: <Widget>[
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Stack(children: [
            Stack(children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
              ),
              Container(
                height: 250.0,
                width: double.infinity,
                color: Color(0xFFFDD148),
              ),
              Positioned(
                bottom: 450.0,
                right: 150.0,
                child: Container(
                  height: 400.0,
                  width: 400.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200.0),
                    color: Color(0xFFFEE16D),
                  ),
                ),
              ),
              Positioned(
                bottom: 500.0,
                left: 230.0,
                child: Container(
                    height: 300.0,
                    width: 300.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(150.0),
                        color: Color(0xFFFEE16D).withOpacity(0.5))),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: IconButton(
                  alignment: Alignment.topLeft,
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {},
                ),
              ),
              Positioned(
                  top: 75.0,
                  left: 15.0,
                  child: Text(
                    "Shopping Cart",
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  )),
              Positioned(
                top: 150.0,
                child: Column(
                  children: [
                    itemCard('Sunsilk', '250', 'pink', true,
                        'assets/shampoo.jpg', 0),
                    itemCard(
                        'Smart TV', '250', 'black', true, 'assets/tv.jpeg', 1),
                    itemCard(
                        'Sofaset', '250', 'brown', false, 'assets/sofa.jpg', 2),
                  ],
                ),
              ),
            ]),
            Container(
              height: 20.0,
            ),
            Padding(
                padding: EdgeInsets.only(top: 650.0, bottom: 15.0),
                child: Container(
                    height: 50.0,
                    width: double.infinity,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text('Total: \$' + totalAmount.toString()),
                        SizedBox(width: 10.0),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            onPressed: () {},
                            elevation: 0.5,
                            color: Colors.red,
                            child: Center(
                              child: Text(
                                'Pay Now',
                              ),
                            ),
                            textColor: Colors.white,
                          ),
                        )
                      ],
                    )))
          ])
        ])
      ]),
      bottomNavigationBar: Material(
          elevation: 7.0,
          color: Colors.white,
          child: Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 50.0,
                          width: 50.0,
                          color: Colors.white,
                          child: Icon(
                            Icons.shopping_basket,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 50.0,
                          width: 50.0,
                          color: Colors.white,
                          child: Icon(
                            Icons.account_box,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 50.0,
                          width: 50.0,
                          color: Colors.white,
                          child: Icon(
                            Icons.shopping_cart,
                            color: Colors.yellow,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 50.0,
                          width: 50.0,
                          color: Colors.white,
                          child: Icon(
                            Icons.account_box,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ]),
              ))),
    );
  }

  Widget itemCard(
      itemName, itemPrice, itemColor, itemAvailability, itemImage, i) {
    return InkWell(
        onTap: () {
          if (itemAvailability) {
            pickToggle(i);
          }
        },
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Material(
            borderRadius: BorderRadius.circular(10.0),
            elevation: 3.0,
            child: Container(
              padding: EdgeInsets.only(left: 15.0, right: 10.0),
              width: MediaQuery.of(context).size.width - 20.0,
              height: 150.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Creating picker button
                        Container(
                          height: 25.0,
                          width: 25.0,
                          decoration: BoxDecoration(
                            color: itemAvailability
                                ? Colors.grey.withOpacity(0.4)
                                : Colors.red.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(12.5),
                          ),
                          child: Center(
                            child: itemAvailability
                                ? Container(
                                    height: 12.0,
                                    width: 12.0,
                                    decoration: BoxDecoration(
                                        color: picked[i]
                                            ? Colors.yellow
                                            : Colors.grey.withOpacity(0.4),
                                        borderRadius:
                                            BorderRadius.circular(6.0)),
                                  )
                                : Container(),
                          ),
                        ),
                      ]),
                  SizedBox(
                    width: 10.0,
                  ),
                  //Creating product image
                  Container(
                    height: 150.0,
                    width: 125.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(itemImage),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  SizedBox(
                    width: 4.0,
                  ),
                  //Creating Product info
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        //ItemName
                        children: <Widget>[
                          Text(
                            itemName,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0),
                          ),
                          SizedBox(width: 7.0),
                          //Item Count
                          itemAvailability
                              ? picked[i]
                                  ? Text(
                                      'x1',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.0,
                                          color: Colors.grey),
                                    )
                                  : Container()
                              : Container()
                        ],
                      ),

                      SizedBox(height: 7.0),
                      //ItemColor
                      itemAvailability
                          ? Text(
                              'Color: ' + itemColor,
                              style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                  color: Colors.grey),
                            )
                          : OutlineButton(
                              onPressed: () {},
                              borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 1.0,
                                  style: BorderStyle.solid),
                              child: Center(
                                child: Text('Find Similar',
                                    style: TextStyle(
                                        fontFamily: 'Quicksand',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.0,
                                        color: Colors.red)),
                              ),
                            ),

                      SizedBox(height: 7.0),
                      itemAvailability
                          ? Text(
                              '\u{20B9}' + itemPrice,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: Color(0xFFFDD34A)),
                            )
                          : Container(),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
