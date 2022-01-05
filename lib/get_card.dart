import 'package:flutter/material.dart';


Widget getCard(index){
  var name = index.name;
  var location = index.location;
  var code = index.code;

  return Card(
    color: Color(0xFFD9D3CA),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListTile(
        title: Row(
          children:<Widget> [
            Container(width: 60, height: 60,
              decoration: BoxDecoration(
                color:Colors.amber,
                borderRadius: BorderRadius.circular(60/2),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('asset/restaurant.jpg'),
                )
            ),
            ),
            SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name.toString(),
                  style: TextStyle(color: Colors.black,fontSize: 17.0, letterSpacing: 2.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_city,color: Colors.blueGrey,),
                    SizedBox(width: 5.0,),
                    Text(location.toString(),
                      style: TextStyle(fontSize: 14.0,color: Color(0xFF1C1B22)),),
                  ],
                ),
                // SizedBox(height: 7,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.code,color: Colors.blueGrey,),
                    SizedBox(width: 5.0,),
                    Text(code.toString(),
                      style: TextStyle(fontSize: 10.0,color: Color(0xFF1C1B22)),),
                  ],
                ),
              ],
            )
          ],

        ),
      ),
    ),
  );
}
