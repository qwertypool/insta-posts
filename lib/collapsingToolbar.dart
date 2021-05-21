import 'package:flutter/material.dart';

class CollapsingToolbar extends StatelessWidget {
  const CollapsingToolbar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Flutter girlz',style: TextStyle(color: Colors.white,fontFamily: 'KoHo',fontSize: 21,),),
              background:Image.network('https://i.pinimg.com/originals/45/ce/52/45ce525ec094c82e494ac95da28d27d7.jpg',
              fit: BoxFit.cover,),
            ),
          ),
          SliverFillRemaining(
             child: Column(
        children: List<int>.generate(7, (index) => index)
        .map((index) => Container(
              height: 40,
              margin: EdgeInsets.symmetric(vertical: 5),
              color: Colors.teal[50],
              alignment: Alignment.center,
              child: Text('Item count : #$index '),
            )).toList(),
        ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),onPressed: (){},backgroundColor: Colors.teal[500],),
    );
  }
}
