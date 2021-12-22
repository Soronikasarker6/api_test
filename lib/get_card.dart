import 'package:flutter/material.dart';


Widget getCard(index){
  var name = index.name;
  var location = index.location;
  var code = index.code;
  // var max_waiter = index.maxWaiter.toInt();
  // var isActive = index.is_active.toInt();
  // int isOutside = index.is_outside.toInt();
  // DateTime createdAt = index.created_at.toIso8601String();
  // DateTime updatedAt = index.updated_at.toIso8601String();

  return Card(
    color: Color(0xFF313157),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListTile(
        title: Row(
          children:<Widget> [
            Container(width: 60, height: 60, decoration: BoxDecoration(
                color:Colors.amber,
                borderRadius: BorderRadius.circular(60/2),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage
                      ("https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixlib=rb-1.2.1&"
                        "ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHJlc3RhdXJhbnR8ZW58MHx8MHx8&w=1000&q=80" )
                )
            ),

            ),
            SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name.toString(),
                  style: TextStyle(fontSize: 17.0, letterSpacing: 2.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_city,color: Colors.blueGrey,),
                    SizedBox(width: 5.0,),
                    Text(location.toString(),
                      style: TextStyle(fontSize: 14.0,color:Colors.grey),),
                  ],
                ),
                // SizedBox(height: 7,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.code,color: Colors.blueGrey,),
                    SizedBox(width: 5.0,),
                    Text(code.toString(),
                      style: TextStyle(fontSize: 10.0,color:Colors.grey),),
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
