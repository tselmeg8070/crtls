import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      child: Scaffold(
        body: Container(
          color: Colors.green,
          width: screenSize.width,
          height: screenSize.height,
          child: StreamBuilder(

          )
        ),
      ),
    );
  }
}

/**
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
    Padding(
    padding:
    EdgeInsets.only(left: 36.0, right: 36.0, top: screenSize.height*0.1),
    child: Text(
    'Таны хадгаламж',
    style: TextStyle(fontSize: 18, color: Colors.green[100]),
    ),
    ),
    Padding(
    padding:
    EdgeInsets.only(left: 36.0, right: 36.0, top: screenSize.height*0.01),
    child: Text(
    '1,900,000₮',
    style: TextStyle(fontSize: 28, color: Colors.white),
    ),
    ),
    Padding(
    padding:
    EdgeInsets.only(left: 36.0, right: 36.0, top: screenSize.height*0.03),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
    ClipRRect(
    borderRadius: BorderRadius.circular(10.0),
    child: Container(
    color: Colors.blue[100],
    width: screenSize.width * 0.37,
    height: screenSize.height * 0.25,
    child: Padding(
    padding: const EdgeInsets.only(left: 18.0, right: 18.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
    Image.asset('assets/growth.png', width: screenSize.width*0.2,),
    Text('500,000₮', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
    Text('Орлого', style: TextStyle(color: Colors.blue[800], fontWeight: FontWeight.w500),)
    ],
    ),
    ),
    ),
    ),
    ClipRRect(
    borderRadius: BorderRadius.circular(10.0),
    child: Container(
    color: Colors.purple[100],
    width: screenSize.width * 0.37,
    height: screenSize.height * 0.25,
    child: Padding(
    padding: const EdgeInsets.only(left: 18.0, right: 18.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
    Image.asset('assets/outcome.png', width: screenSize.width*0.2,),
    Text('300,000₮', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
    Text('Зарлага', style: TextStyle(color: Colors.purple[800], fontWeight: FontWeight.w500),)
    ],
    ),
    ),
    ),
    ),
    ],
    ),
    ),
    Expanded(
    child: Padding(
    padding: const EdgeInsets.only(top: 38.0),
    child: ClipRRect(
    borderRadius: BorderRadius.only(
    topLeft: Radius.circular(20),
    topRight: Radius.circular(20)),
    child: Container(
    width: screenSize.width,
    height: screenSize.height*0.9,
    color: Colors.white,
    child: Padding(
    padding: const EdgeInsets.only(left: 32, right: 32),
    child: ListView(
    physics: BouncingScrollPhysics(),
    //                        mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
    Text('Топ зарлага', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),

    ],
    ),
    ),
    ),
    ),
    ),
    )
    ],
    ),
*/