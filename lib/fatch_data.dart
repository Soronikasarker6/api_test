import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:api_test/get_card.dart';
import 'package:api_test/details.dart';
import 'package:api_test/Model.dart';
import 'package:page_transition/page_transition.dart';


const url = 'http://50.21.176.24/tables#';
class FatchDataScreen extends StatefulWidget {

  @override
  _FatchDataScreenState createState() => _FatchDataScreenState();
}

class _FatchDataScreenState extends State<FatchDataScreen> {
  sdsd()async{
    var v = await getData();
    List g = v.map((x) => Tables.fromJson(x)).toList();

    return g;
  }

  List users = [];
  bool isLoading = false;
  // final List<DetailsModel> restaurantData = List.generate(users.length,
  //         (index) =>DetailsModel(name, location, code, max_waiter,
  //             is_active, is_outside, created_at, updated_at, orders)
  // );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getData();

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
    getData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2F2A65),
        centerTitle: true,
        title: Text('Restaurant'),
      ),
      body: getBody(),
      backgroundColor: Color(0xFF2F2A65),
    );
  }
  Widget getBody() {
    // List items = ["1", "2", "3"];
    return ListView.builder(
        itemCount: users ==null ? 0 : users.length,
        itemBuilder: (context, index){

          return GestureDetector(
              onTap: (){
                Navigator.of(context).push(PageTransition(type: PageTransitionType.fade,alignment: Alignment.bottomCenter,
                    child:Details( name: users[index].name,location: users[index].location, code: users[index].code,
                        maxWaiter: users[index].maxWaiter, isActive: users[index].isActive,isOutside: users[index].isOutside,
                    createdAt: users[index].createdAt, updatedAt: users[index].updatedAt,orders: users[index].orders
                    )
                ));
              },


              child: getCard(users[index])
          );
        });
  }


}
