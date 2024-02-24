import 'package:flutter/material.dart';

import '../../../main.dart';
import '../widgets/main_button_widget.dart';


class WrapScrollViewPage extends StatelessWidget {
  const WrapScrollViewPage({super.key});

  @override
Widget build(BuildContext context) {


  const double tileHeight = 80;
  const double tileWidth = 90;
  final buttonItems = List<Widget>.generate(
    12,
        (i) =>
        InkWell(
            onTap: () => {
              Navigator.of(context)
                  .pushNamed("/test")
            },//_showToast(context), // Handle your callback
            child: Ink(

              height: tileHeight,
              width: tileWidth,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text('Item $i'),
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
              flex:7,
              child: Column(
                  children: <Widget>[
                    MainButtonsWidget(buttonItems: buttonItems),
            ])
      ),

            Flexible(
              flex: 3,
              child: Container(
                color: Colors.orange,
                child: ListView.builder(
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