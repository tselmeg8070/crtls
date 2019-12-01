import 'package:pie_chart/pie_chart.dart';
import 'package:flutter/material.dart';

class PersonalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
        child: Scaffold(
        body: Container(
        color: Colors.green,
        width: screenSize.width,
        height: screenSize.height,
          child:
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
                '3124141₮',
                style: TextStyle(fontSize: 28, color: Colors.white),
              ),
            ),
            Padding(
              padding:
              EdgeInsets.only(left: 36.0, right: 36.0, top: screenSize.height*0.03),
              child: Column(
                children: <Widget>[
                  Row(
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
                                Text('321231₮', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
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
                                Text('134112₮', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                                Text('Зарлага', style: TextStyle(color: Colors.purple[800], fontWeight: FontWeight.w500),)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 14.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        color: Colors.grey[100],
                        width: screenSize.width * 0.8,
                        height: screenSize.height * 0.1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Image.asset('assets/income.png', width: screenSize.width*0.2,),

                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('32131₮', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                                  Text('Хуримтлах боломж', style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w500),)

                                ],),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ])
    )
    ));
  }
}