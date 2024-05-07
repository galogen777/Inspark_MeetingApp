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
              //Navigator.of(context).pushNamed("/test")
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
                        stops: [0.0, 0.8],
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
                       height: 56,
                     ),
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Text('Включить свет в переговорной',
                         textAlign: TextAlign.center,
                         style: TextStyle(
                           fontSize: 16,
                           height: 1.1,
                           fontWeight: FontWeight.w500,
                           color: Colors.white70
                         ),

                       ),
                     ),


                   ],

                  ),
                ),

                  Column(

                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        
                        children: [

                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: SvgPicture.asset(
                              'assets/co2.svg',
                              height: 35,
                              width: 35,
                              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                                                       ),
                           ),
                        //),
                      ])

                    ],
                  )
                ] //Stack children
              ),
            )),

  );

  return Scaffold(
    //appBar: AppBar(title: const Text('SingleChildScrollView + Wrap')),
    appBar: AppBar(
        title: const Text(
          'Переговорная Бештау',
          style: TextStyle(color: Colors.white70),
        ),
        backgroundColor: Colors.black87,
        actions: <Widget>[


          Container(
            child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(width: 160.0,
                    child: const Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text("Москва",style: TextStyle(fontSize: 20,color: Colors.white70),)]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text("17:56",style: TextStyle(fontSize: 18,color: Colors.white70),)]
                      )],
                    ),
                  ),
                  Container(width: 160.0,
                    child: const Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text("Новосибирск",style: TextStyle(fontSize: 20,color: Colors.white70),)]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text("19:56",style: TextStyle(fontSize: 18,color: Colors.white70),)]
                        )],
                    ),
                  ),
                  Container(width: 160.0,
                    child: const Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text("Иркутск",style: TextStyle(fontSize: 20,color: Colors.white70),)]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text("22:56",style: TextStyle(fontSize: 18,color: Colors.white70),)]
                        )],
                    ),
                  ),

              ],
            ),
          )
        ]
    ),

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
                margin: const EdgeInsets.only(right:5.0),
                color: Colors.black87,

                child: ListView.separated(

                  padding: const EdgeInsets.only(top: 20,bottom: 20),
                  itemCount: 7,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (_, i) => ListTile(
                      //title: Text("List 1: $i"),
                      textColor: Colors.white,

                    leading: SvgPicture.asset(
                    'assets/co2.svg',
                    colorFilter:ColorFilter.mode(Colors.white70, BlendMode.srcIn) ,
                    height: 100,
                    width: 100,
                  ),
                    title: Text(
                      '698 ppm',
                        textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 24

                      )

                    ),

                ), separatorBuilder: (context, index) => SizedBox(
                  height: 24,
                ),
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
    bottomNavigationBar: BottomNavigationBar(
      backgroundColor: Colors.black87,
      selectedItemColor: Colors.white70,
      unselectedItemColor: Colors.white30,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Badge(child: Icon(Icons.notifications_sharp)),
          label: 'Уведомления',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.brightness_5),
          label: 'Настройки',
        ),
      ],
      currentIndex: 0,
      //onTap: _onItemTapped,
    ),
  );
}
}