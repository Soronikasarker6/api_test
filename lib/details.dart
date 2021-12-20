import 'package:flutter/material.dart';

class Details extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details', style: TextStyle(color: Colors.black,),),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Card(
            child: Column(
              children: [
                ListTile(
                  title: Text("id"),
                  subtitle: Text('Subtitle'),
                ),
                ListTile(
                  title: Text("name"),
                  subtitle: Text('Subtitle'),
                ),
                ListTile(
                  title: Text("location"),
                  subtitle: Text('Subtitle'),
                ),
                ListTile(
                  title: Text("code"),
                  subtitle: Text('Subtitle'),
                ),
                ListTile(
                  title: Text("max_waiter"),
                  subtitle: Text('Subtitle'),
                ),
                ListTile(
                  title: Text("is_active"),
                  subtitle: Text('Subtitle'),
                ),
                ListTile(
                  title: Text("is_outside"),
                  subtitle: Text('Subtitle'),
                ),
                ListTile(
                  title: Text("created_at"),
                  subtitle: Text('Subtitle'),
                ),
                ListTile(
                  title: Text("updated_at"),
                  subtitle: Text('Subtitle'),
                ),
                ListTile(
                  title: Text("orders"),
                  subtitle: Text('Subtitle'),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
