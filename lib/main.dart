import 'package:api_test/api_check.dart';
import 'package:api_test/splash.dart';
import 'package:flutter/material.dart';
import 'package:api_test/fatch_data.dart';


void main()=> runApp( MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home:ApiCheck(),

    );
  }
}
// class Check extends StatefulWidget {
//   const Check({Key? key}) : super(key: key);
//
//   @override
//   State<Check> createState() => _CheckState();
// }
//
// class _CheckState extends State<Check> {
//
//   final List<String> entries = <String>['JA', 'JA', 'AC', 'JA'];
//   final List<Color> colorCodes = <Color>[Color(0xff07154f), Color(0xff07154f),Color(0xffc61f84), Color(0xff07154f),];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:
//       ListView.builder(
//           padding: const EdgeInsets.all(8),
//           itemCount: entries.length,
//           itemBuilder: (BuildContext context, int index) {
//             return Container(
//               height: 50,
//               color: colorCodes[index],
//               child: Center(child: Text('Entry ${entries[index]}')),
//             );
//           }
//       )
//
//     );
//   }
// }

