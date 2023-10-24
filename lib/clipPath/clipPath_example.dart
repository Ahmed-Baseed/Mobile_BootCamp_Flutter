import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_flutter/clipPath/shapeClass.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ClipPathExample extends StatefulWidget {
  const ClipPathExample({super.key});

  @override
  State<ClipPathExample> createState() => _ClipPathExampleState();
}

class _ClipPathExampleState extends State<ClipPathExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 252, 163, 17),
      body: SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.all(10),
            // Staggered Grid View starts here
            child: StaggeredGrid.count(
          crossAxisCount: 10,
          children: [
            StaggeredGridTile.count(crossAxisCellCount: 2, mainAxisCellCount: 3, child: Container(color: Colors.amber,)),
            StaggeredGridTile.count(crossAxisCellCount: 2, mainAxisCellCount: 2, child: Container(color: Colors.red,)),
            StaggeredGridTile.count(crossAxisCellCount: 2, mainAxisCellCount: 3, child: Container(color: Colors.black,)),
            StaggeredGridTile.count(crossAxisCellCount: 2, mainAxisCellCount: 2, child: Container(color: Colors.blue,)),
            StaggeredGridTile.count(crossAxisCellCount: 2, mainAxisCellCount: 3, child: Container(color: Colors.green,)),
            StaggeredGridTile.count(crossAxisCellCount: 2, mainAxisCellCount: 2, child: Container(color: Colors.purple,)),
            StaggeredGridTile.count(crossAxisCellCount: 2, mainAxisCellCount: 3, child: Container(color: Colors.grey,)),
            StaggeredGridTile.count(crossAxisCellCount: 2, mainAxisCellCount: 2, child: Container(color: Colors.teal,)),
          ],
          mainAxisSpacing: 3,
          crossAxisSpacing: 3,
        )),
      ),
      //  Stack(
      //   children: [
      //     Positioned(
      //       bottom: 0,
      //       child: CustomPaint(
      //         size: Size(
      //             MediaQuery.of(context).size.width,
      //             (MediaQuery.of(context).size.width * 2.16)
      //                 .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
      //         painter: RPSCustomPainter(),
      //       ),
      //     ),
      //     Positioned(
      //         child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Container(
      //           margin: EdgeInsets.all(15),
      //           padding: EdgeInsets.only(right: 10, left: 10),
      //           decoration:
      //               BoxDecoration(
      //                 borderRadius: BorderRadius.circular(20),
      //                 color: Color.fromARGB(255, 255, 255, 255)),
      //           child: TextFormField(
      //             decoration: InputDecoration(

      //               label: Text("Course Hours"),
      //             ),
      //           ),
      //         ),
      //       ],
      //     )),
      //   ],
      // ),
    );
  }
}
