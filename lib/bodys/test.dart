// class MyHomePage extends StatelessWidget {
//   final double topWidgetHeight = 200.0;
//   final double avatarRadius = 50.0;

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       body: new Stack(
//         children: <Widget>[
//           new Column(
//             children: <Widget>[
//               new Container(
//                 height: topWidgetHeight,
//                 color: Colors.yellow,
//               ),
//               new Container(
//                 color: Colors.red,
//               )
//             ],
//           ),
//           new Positioned(
//             child: new CircleAvatar(
//               radius: avatarRadius,
//               backgroundColor: Colors.green,
//             ),
//             left: (MediaQuery.of(context).size.width / 2) - avatarRadius,
//             top: topWidgetHeight - avatarRadius,
//           )
//         ],
//       ),
//     );
//   }
// }
