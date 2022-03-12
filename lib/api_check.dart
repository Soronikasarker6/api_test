import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'Model/record.dart';
class ApiCheck extends StatefulWidget {
  const ApiCheck({Key? key}) : super(key: key);

  @override
  State<ApiCheck> createState() => _ApiCheckState();
}

class _ApiCheckState extends State<ApiCheck> {
  final String url =  "https://app.schertech.com/task_visu/php/task_visu_data_service.php?"
      "service=get_all_task&user_id=101004&start_date=01.01.2019%2000:"
      "00&end_date=01.01.2050%2000:00&status=offen&task_type=my_task&team_id=0"
      "&stage_key=";
  List myAllData = [];

  @override
  void initState() {
    loadData();
  }

  loadData() async {
    http.Response response = await http.get(Uri.parse(url));
    if(response.statusCode== 200){
      String data = response.body;
      var decodeData = jsonDecode(data)['records'];
      List global = decodeData.map((x) => Records.fromJson(x)).toList();
      setState(() {
        myAllData= global ;
      });
      return decodeData;
    }else{
      setState(() {
        myAllData = [];

      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Testing"),
      centerTitle: true,
      backgroundColor: Color(
        0xff7d0545),),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: myAllData.length,
        itemBuilder: (BuildContext context, int index) {
          return  buildRecordShimmer(index);
        },
      ),
    );
  }

  Widget buildRecordShimmer(int index) {
    // String identifyName= myAllData[index].responsibleName[0];
    String getInitials(String name) =>
        name.isNotEmpty ? name.trim().split(' ').map((l) => l[0]).take(2).join (): '';

    final List<Color> colorCodes = <Color>[
      Color(0xff07154f),
      Color(0xff07154f),
      Color(0xff07154f),
      Color(0xff07154f),
      Color(0xffc68e1f),
      Color(0xff07154f),
      Color(0xff1fc6b3),
      Color(0xff1fc6b3),
      Color(0xffc61f84),
      Color(0xff07154f),
      Color(0xffc61f84),
      Color(0xff07154f),
      Color(0xff07154f),
      Color(0xff07154f),
      Color(0xff07154f),
      Color(0xff07154f),
      Color(0xff07154f),
      Color(0xff07154f),
      Color(0xff07154f),
      Color(0xff07154f),
    ];
// Random random = new Random();

    return Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
            ),
            child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: colorCodes[index],
                child: Text(getInitials(myAllData[index].responsibleName),
                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontFamily: ''),),),
                title: (
                      Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("ID: ${myAllData[index].id}"),
                        Text("Problem : ${myAllData[index].problem}"),
                        // Text("Task Type: ${myAllData[index].taskType}"),
                        Text(myAllData[index].responsibleName),
                      ],
                    )),
            ),
          );
  }
}
//