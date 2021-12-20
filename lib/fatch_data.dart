import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:api_test/get_card.dart';

import 'details.dart';

const url = 'http://50.21.176.24/tables#';
class FatchDataScreen extends StatefulWidget {

  @override
  _FatchDataScreenState createState() => _FatchDataScreenState();
}

class _FatchDataScreenState extends State<FatchDataScreen> {

  List users = [];
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getData();
  }

  void getData()async{
    http.Response response= await http.get(Uri.parse(url));

    if(response.statusCode== 200){
      String data = response.body;
      var decodeData = jsonDecode(data)['tables'];
      setState(() {
        users = decodeData;
      });
      var name = decodeData['tables'][0]['name'];
      var created = decodeData['tables'][1]['created_at'];
      print (created);
      print(name);
      return decodeData;
    }else{
      setState(() {
        users =[];
      });
    }
  }
  @override

  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Api fetch'),
      ),
      body: getBody(),
    );
  }
  Widget getBody(){
    // List items = ["1", "2", "3"];
    return ListView.builder(

        itemCount: users.length,
        itemBuilder: (context, index){
          return GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Details()));
              },

              child: getCard(users[index]));
        });
  }


}
