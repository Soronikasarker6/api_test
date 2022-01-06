import 'dart:core';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:api_test/get_card.dart';
import 'package:api_test/details.dart';
import 'package:api_test/Model.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:animations/animations.dart';

const url = 'http://50.21.176.24/tables#';
class FatchDataScreen extends StatefulWidget {

  @override
  _FatchDataScreenState createState() => _FatchDataScreenState();
}

class _FatchDataScreenState extends State<FatchDataScreen> {
  int _selectedIndex = 0;
  PageController pageController = PageController();


  sdsd()async{
    var v = await getData();
    List g = v.map((x) => Tables.fromJson(x)).toList();

    return g;
  }

  List users = [];
  bool isLoading = false;


  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    pageController = PageController();

  }
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

   getData()async{
    http.Response response= await http.get(Uri.parse(url));

    if(response.statusCode== 200){
      String data = response.body;
      var decodeData = jsonDecode(data)['tables'];
      List g = decodeData.map((x) => Tables.fromJson(x)).toList();
      setState(() {
        users=g;
      });

      // var name = decodeData['tables'][0]['name'];
      // var created = decodeData['tables'][1]['created_at'];
      // print (created);
      // print(name);
      return decodeData;
    }else{
      setState(() {
        users = [];

      });
    }
  }
  @override

  Widget build(BuildContext context) {

    final List<Widget> items = <Widget>[
      Icon(Icons.home, size: 30, color: Colors.black, semanticLabel: 'home',),
      Icon(Icons.search, size: 30,color: Colors.black),
      Icon(Icons.favorite_outlined, size: 30,color: Colors.black),
      Icon(Icons.person, size: 30,color: Colors.black),
    ];

    getData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFDDC2A2),
        centerTitle: true,
        title: Text('Restaurant',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, letterSpacing: 2.0),),
      ),
      body:PageView(
        controller: pageController,
        onPageChanged: (index){
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          Container(
            child: Hero(
              tag:'img',
              child: getBody(),
            ) ,
          ),
          Container(color: Colors.black,),
          Container(color: Colors.teal,),
          Container(color: Colors.grey,)
        ],
      ),

      backgroundColor: Color(0xFFFAFAFC),
      bottomNavigationBar:
      CurvedNavigationBar
        (
        backgroundColor: Color(0xFFDDC2A2),
        height: 60, index: _selectedIndex,
        onTap: onTapped, items: items,
      ),

      // BottomNavigationBar(items:const<BottomNavigationBarItem> [
      //   BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //   BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
      //   BottomNavigationBarItem(icon: Icon(Icons.favorite_outline), label: 'Favorites'),
      // ],currentIndex:_selectedIndex,
      //   selectedItemColor: Colors.black,
      //   unselectedItemColor: Colors.grey,
      //   onTap: onTapped,
      //   backgroundColor: Colors.white,
      //   showUnselectedLabels: false,
      // ),
    );

  }
  Widget getBody() {

    // List items = ["1", "2", "3"];
    return ListView.builder(
        itemCount: users ==null ? 0 : users.length,
        itemBuilder: (context, index){

          return GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                    PageRouteBuilder(fullscreenDialog: false,
                        transitionDuration: Duration(milliseconds:1000),
                        reverseTransitionDuration: Duration(milliseconds: 1000),
                        pageBuilder:(BuildContext context,Animation<double> animation,Animation<double> secondaryAnimation)
                  =>FadeTransition(
                    opacity: animation,
                    child: Details
                      ( name: users[index].name,location: users[index].location, code: users[index].code,
                          maxWaiter: users[index].maxWaiter, isActive: users[index].isActive,isOutside: users[index].isOutside,
                      createdAt: users[index].createdAt, updatedAt: users[index].updatedAt,orders: users[index].orders,),
                  ),

                        transitionsBuilder: (BuildContext context,Animation<double> animation,Animation<double> secondaryAnimation,
                      Widget  child)
                {
                  // animation = CurvedAnimation(parent: animation, curve:  Curves.easeInOut);
                  return child;
                }

                )
                );
              },

              child: getCard(users[index])
          );
        });
  }



}
