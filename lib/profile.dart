import 'package:flutter/material.dart';
import 'colorCodes.dart';
class Profile extends StatelessWidget {
  const Profile({Key key}) : super(key: key);
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: pPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(pDefaultPadding,50,pDefaultPadding,20),
        child: Column(children: [
          Center(
            child: Stack(
               children:[ CircleAvatar(
                backgroundImage: AssetImage('assets/meeme3.jpg'),
                radius: 90,
              ),
              Positioned(
              right: 0,
              bottom:0,
              child: Icon(Icons.camera_alt_rounded,size: 40,color: pPrimaryColor,),)
             ],
            ),
          ),
          SizedBox(height: pDefaultPadding*1.2,),
          Expanded(
          child: ListView(
            children: <Widget>[
              Card(
                color: Colors.transparent,
                elevation: 0,
                child: ListTile(
                  leading: Icon(Icons.person,color: pPrimaryColor,),
                  title: Text('Name',style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Opacity(
                    opacity: 0.8,
                    child: Text( 'Deepa Pandey ',
                        style: TextStyle(color:Theme.of(context).textTheme.bodyText1.color),),
                  ),
                  trailing: Icon(Icons.edit),
                ),
               ),
               Divider(color: Colors.grey[300], thickness: 1,indent: 65,endIndent: 5,),
              Card(
                color: Colors.transparent,
                elevation: 0,
                child: ListTile(
                  leading: Icon(Icons.info_outline_rounded,color: pPrimaryColor,),
                  title: Text('About',style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Opacity(
                    opacity: 0.8,
                    child: Text('Accustomed 🤕 wid coding 👨‍💻 & covid 🦠 ',
                        style: TextStyle(color:Theme.of(context).textTheme.bodyText1.color),),),
                  trailing: Icon(Icons.edit),
                  isThreeLine: true,
                ),
               ),
               Divider(color: Colors.grey[300], thickness: 1,indent: 65,endIndent: 5,),
               
              Card(
                color: Colors.transparent,
                elevation: 0,
                child: ListTile(
                  leading: Icon(Icons.phone,color: pPrimaryColor,),
                  title: Text('Phone',style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Opacity(
                    opacity: 0.8,
                      child: Text('+91 12345 67890 ',
                        style: TextStyle(color:Theme.of(context).textTheme.bodyText1.color),
                    ),
                  ),
                  trailing: Icon(Icons.edit),
                ),
               ),
          ], ),
          ),],
        ),
      ),
    ); }
  }