import 'dart:async';
import 'package:flutter/material.dart';

import 'colorCodes.dart';
import 'homepage.dart';
void main() {
runApp(MyApp());
}

class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
    return MaterialApp(
    title: 'Light/Dark Theme',
    // theme:ThemeData(
    //   fontFamily: 'KoHo',
    //   primaryColor: Colors.black,
    // ),
    theme: lightThemeData(context),
    darkTheme: darkThemeData(context),
    home: MyHomePage(),
    debugShowCheckedModeBanner: false,
	);
}
}

class MyHomePage extends StatefulWidget {
@override
_MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
@override
void initState() {
	super.initState();
	Timer(Duration(seconds: 1),
		()=>Navigator.pushReplacement(context,
										MaterialPageRoute(builder:
														(context) =>
														SecondScreen()
														)
									)
		);
}
@override
Widget build(BuildContext context) {
	return Container(
	color: Colors.white,
	child:FlutterLogo(size:MediaQuery.of(context).size.height)
	);
}
}

