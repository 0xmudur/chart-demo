import 'package:finfree_demo/http_handler.dart';
import 'package:flutter/material.dart';
import 'line_chart_sample2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  HttpHandler httpHandler = new HttpHandler();
  String period = 'oneDay';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: const Color(0xff37434d),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            FutureBuilder(
              key: UniqueKey(),
              future: getData(period),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 32.0, right: 16.0, left: 16.0),
                    child: LineChartSample2(snapshot.data),
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                return CircularProgressIndicator();
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            period = 'oneDay';
                            getData(period);
                          });
                        },
                        child: Text(
                          '1G',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff02d39a)),
                        )),
                  ),
                  Text('|',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  InkWell(
                      onTap: () {
                        setState(() {
                          period = 'oneWeek';

                          getData(period);
                        });
                      },
                      child: Text('1H',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff02d39a)))),
                  Text('|',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  InkWell(
                      onTap: () {
                        setState(() {
                          period = 'oneMonth';

                          getData(period);
                        });
                      },
                      child: Text('1A',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff02d39a)))),
                  Text('|',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  InkWell(
                      onTap: () {
                        setState(() {
                          period = 'threeMonths';
                          getData(period);
                        });
                      },
                      child: Text('3A',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff02d39a)))),
                  Text('|',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  InkWell(
                      onTap: () {
                        setState(() {
                          period = 'oneYear';
                          getData(period);
                        });
                      },
                      child: Text('1Y',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff02d39a)))),
                  Text('|',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  InkWell(
                      onTap: () {
                        setState(() {
                          period = 'fiveYears';

                          getData(period);
                        });
                      },
                      child: Text('5Y',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff02d39a)))),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }

  ///Fetch data from API for every @param period
  Future<dynamic> getData(String period) async {
    HttpHandler httpHandler = new HttpHandler();
    var response = await httpHandler.getData(period);
    return response;
  }
}
