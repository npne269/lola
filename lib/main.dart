import 'package:flutter/material.dart';
import 'package:singlepage/ui/homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SinglePage',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   String mySchool;
//   String myClass;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue,
//       body: Stack(
//         children: <Widget>[
//           Column(
//             children: <Widget>[
//               Container(
//                 height: MediaQuery.of(context).size.height * 0.4,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.vertical(
//                         bottom: Radius.elliptical(100, 30)),
//                     gradient:
//                         LinearGradient(colors: [Colors.black45, Colors.black])),
//               ),
//               Container(
//                 height: MediaQuery.of(context).size.height * 0.6,
//               )
//             ],
//           ),
//           Column(
//             children: <Widget>[
//               Flexible(child: FlutterLogo()),
//               Container(
//                 height: MediaQuery.of(context).size.height * 0.5,
//                 width: MediaQuery.of(context).size.width * 0.8,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: Colors.white,
//                     boxShadow: [
//                       BoxShadow(
//                           color: Colors.black45,
//                           offset: Offset(3, 4),
//                           spreadRadius: 1.0)
//                     ]),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 20),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: <Widget>[
//                       Text('School'),
//                       DropdownButton(
//                         hint: Text('Choose School'),
//                         isExpanded: true,
//                           items: [
//                             DropdownMenuItem(child: Text('Hello')),
//                             DropdownMenuItem(child: Text('Hello')),
//                             DropdownMenuItem(child: Text('Hello')),
//                             DropdownMenuItem(child: Text('Hello')),
//                           ],
//                           onChanged: (value) {
//                             setState(() {});
//                             mySchool = value;
//                           }),
//                       Text('class'),
//                       DropdownButton(
//                         hint: Text('Choose class'),
//                           items: [
//                             DropdownMenuItem(child: Text('Hello')),
//                             DropdownMenuItem(child: Text('Hello')),
//                             DropdownMenuItem(child: Text('Hello')),
//                             DropdownMenuItem(child: Text('Hello')),
//                           ],
//                           value: myClass,
//                         isExpanded: true,
//                           onChanged: (value) {
//                             setState(() {});
//                             myClass = value;
//                           }),

//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
