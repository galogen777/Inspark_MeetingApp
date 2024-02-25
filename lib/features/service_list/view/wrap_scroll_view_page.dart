import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test_project5/theme/theme.dart';

import '../../../main.dart';
import '../widgets/main_button_widget.dart';


class WrapScrollViewPage extends StatelessWidget {
  const WrapScrollViewPage({super.key});

  @override
Widget build(BuildContext context) {


  //const double tileHeight = 90;
  //const double tileWidth = 90;
  final buttonItems = List<Widget>.generate(
    18,
        (i) =>
        InkWell(
            onTap: () => {
              Navigator.of(context)
                  .pushNamed("/test")
            },//_showToast(context), // Handle your callback
            child: Container(
              child: Stack(
                children: [
                  Ink(
                  height: 500,
                  width: 500,
                  decoration: BoxDecoration(
                    //color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                        colors: [
                          Color(0xFF151518),
                          Color(0xFF545353),
                        ],
                        begin: FractionalOffset(0.0, 1.0),
                        end: FractionalOffset(0.0, 0.0),
                        stops: [0.0, 0.4],
                        ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(

                   children: [
                     SizedBox(
                       height: 75,
                     ),
                     Text('test1'),


                   ],
                  ),
                ),
                  Positioned(
                    left: 65,

                    child: SvgPicture.asset(
                      'assets/co2.svg',
                      height: 35,
                      width: 35,
                      colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    ),
                  ),
                ] //Stack children
              ),
            )),

  );

  return Scaffold(
    //appBar: AppBar(title: const Text('SingleChildScrollView + Wrap')),
    body:  SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
        // Column(
        //   children: [
        //     Row(
        //       children: <Widget>[
        //          Expanded(
        //           flex: 7, // 20%
        //             child: Column(
        //               children: <Widget>[
        //                 MainButtonsWidget(buttonItems: buttonItems),
        //
        //               ],
        //                             ),
        //         ),
        //         Expanded(
        //           flex: 3, // 60%
        //           child: Container(
        //               color: Colors.yellow,
        //               child: Column(
        //                 children: <Widget>[
        //                   const MeetingsListWidget()
        //
        //                 ],
        //
        //               )
        //           ),
        //         ),
        //
        //       ],
        //     )
        //   ],
        // ),

        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              flex: 3,
              child: Container(
                margin: new EdgeInsets.only(right:5.0),
                color: Colors.orange,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (_, i) => ListTile(title: Text("List2: $i")),
                ),
              ),
            ),
            Flexible(

              flex:7,
              child: GridView.count(
                  primary: false,
                  shrinkWrap: false,
                  padding: const EdgeInsets.all(0),
                  scrollDirection: Axis.vertical,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio:1,
                  crossAxisCount:MediaQuery.of(context).orientation == Orientation.portrait ? 3 : 5,
                  physics: const ScrollPhysics(),
                  children: buttonItems.map((i) => i).toList()
              ),
            ),

            Flexible(
              flex: 3,
              child: Container(
                margin: new EdgeInsets.only(left:5.0),
                color: Colors.orange,
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (_, i) => ListTile(title: Text("List2: $i")),
                ),
              ),
            ),
          ],
        )
      ),
    ),
  );
}
}