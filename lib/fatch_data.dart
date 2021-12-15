import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

const url = 'http://50.21.176.24/tables#';
class FatchDataScreen extends StatefulWidget {

  @override
  _FatchDataScreenState createState() => _FatchDataScreenState();
}

class _FatchDataScreenState extends State<FatchDataScreen> {

   List<dynamic> user = [];
   bool isLoading = true;



  void getData()async{
    http.Response response= await http.get(Uri.parse(url));
    print(response.statusCode);

    if(response.statusCode== 200){
      String data = response.body;
      print(data);
      var decodeDate = jsonDecode(data);
      var name = decodeDate['tables'][0]['name'];
      var created = decodeDate['tables'][1]['created_at'];
      print (created);
      setState(() {
        user = name;
      });
      print(name);
      return decodeDate;
    }else{
      setState(() {
        user = [];
      });
      print (response.statusCode);
    }
  }
  @override

  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: AppBar(
        title: Text('Api fetch'),
      ),
    body: getBody(),
    );
  }
  Widget getBody(){
    List items = ["1", "2"];
    return ListView.builder( itemCount: user.length,itemBuilder: (context,index){
      return getCard(user[index]);
    },);
  }
  Widget getCard(items){
    var  tables= items['id']['name']['location']['code']['waiter']['active']['outside']['created']['updated'];
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          title: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color:  Colors.white,
                  borderRadius: BorderRadius.circular(10.0 ),

                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:<Widget> [
                  Text(tables.toString(),),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}
//http://50.21.176.24/tables#