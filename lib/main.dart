import 'package:apk_state_mngt/application_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isChecked = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: ChangeNotifierProvider(
      create: (context) => ApplicationColor(),
      child: Scaffold(
        appBar: AppBar(
          title: Consumer<ApplicationColor>(
            builder: (context, applicationColor, _) => Text(
              "Provider State Management",
              style: TextStyle(color: applicationColor.color),
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Consumer<ApplicationColor>(
                builder: (context, applicationColor, _) => AnimatedContainer(
                    margin: EdgeInsets.all(5),
                    width: 100,
                    height: 100,
                    color: applicationColor.color,
                    duration: Duration(milliseconds: 500)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Text("AB"),
                  ),
                  Consumer<ApplicationColor>(
                      builder: (context, applicationColor, _) => Switch(
                          value: _isChecked,
                          onChanged: (newValue) {
                            setState(() {

                              applicationColor.isLightBlue = newValue;
                              _isChecked = newValue;

                            });
                          })),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Text("LB"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
