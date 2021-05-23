import 'package:flutter/material.dart';
import 'package:splash_screen_trial/colorCodes.dart';
import 'package:splash_screen_trial/profile.dart';

class DarkMode extends StatelessWidget {
  const DarkMode({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Brightness brightnessValue =
    MediaQuery.of(context).platformBrightness;
    bool isDark = brightnessValue == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text('Light & Dark Mode'),
        actions: [
          IconButton(icon: Icon(Icons.lightbulb_outline_rounded), onPressed: (){})
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          Text('Light & Dark Mode Demo ❤️',style: TextStyle(fontSize: 18),),
          Divider(
            color:Colors.grey ,
            height: 15,
            thickness: 2,
            endIndent: 90,
            indent: 90,
          ),
          Divider(
            color:Colors.grey ,
            height: 2,
            thickness: 2,
            endIndent: 110,
            indent: 110,
          ),
          SizedBox(height: 10,),
          Image.network('https://freepngimg.com/thumb/cartoon/4-2-cartoon-transparent.png',height: 300,width: 300,),
          Spacer(),
          RawMaterialButton(
            constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width*0.9,
              minHeight: 40),
            onPressed: (){ Navigator.push(
              context, MaterialPageRoute(builder: (context) => Profile()));
              }, 
          fillColor: Theme.of(context).textTheme.bodyText1.color,
          child: Text('Click to proceed ',style: TextStyle(fontSize: 18),),
          textStyle: isDark? TextStyle(color: pPrimaryColor):TextStyle(color: Colors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5)
          ),
          ),
         SizedBox(height: 30,),
        ],
      ),
    );
  }
}