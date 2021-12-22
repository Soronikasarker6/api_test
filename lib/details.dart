import 'package:flutter/material.dart';
import 'package:api_test/Model.dart';

class Details extends StatelessWidget {
  // final Animation<double> transitionAnimation;

  String name;
  String location;
  String code;
  int maxWaiter;
  int isActive;
  int isOutside;
  DateTime createdAt;
  DateTime updatedAt;
  List<Order> orders;

  Details(
      {required this.name,
     required this.location,
     required this.code,
      required this.maxWaiter,
      required this.isActive,
     required  this.isOutside,
     required  this.createdAt,
      required this.updatedAt,
        required this.orders}); //
// Details({required this.restaurantDetails});

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${name}',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF2F2A65),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Card(
            color: Color(0xFF313157),
            child: Column(
              children: [

                ListTile(
                  title: Text("location"),
                  subtitle: Text('$location'),
                ),
                ListTile(
                  title: Text("code"),
                  subtitle: Text('$code'),
                ),
                ListTile(
                  title: Text("max_waiter"),
                  subtitle: Text('$maxWaiter'),
                ),
                ListTile(
                  title: Text("is_active"),
                  subtitle: Text('$isActive'),
                ),
                ListTile(
                  title: Text("is_outside"),
                  subtitle: Text('$isOutside'),
                ),
                ListTile(
                  title: Text("created_at"),
                  subtitle: Text('$createdAt'),
                ),
                ListTile(
                  title: Text("updated_at"),
                  subtitle: Text('$updatedAt'),
                ),
                ListTile(
                  title: Text("orders"),
                  subtitle: Text('$orders'),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
