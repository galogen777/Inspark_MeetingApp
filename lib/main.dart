import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MeetingRoomMananger());
}

class MeetingRoomMananger extends StatelessWidget {
  const MeetingRoomMananger({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      // home: Scaffold(
      //   body: SafeArea(
      //     child: Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Column(
      //         children: [
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //             IconButton(onPressed: (){},
      //                 icon: const Icon(Icons.arrow_back)
      //             ),
      //             IconButton(onPressed: (){},
      //                 icon: const Icon(Icons.keyboard_option_key)
      //             )
      //           ]),
      //           const Text('data'),
      //
      //           ],
      //
      //       ),
      //     ),
      //   ),
      //
      // ),
      title: 'TEST',
      theme: ThemeData(
        dividerColor: Colors.amber,
        colorScheme: ColorScheme.fromSeed( seedColor: Colors.cyan,background: const Color.fromARGB(255, 255, 255, 240)),
        useMaterial3: true,
        textTheme:const  TextTheme(
          bodyMedium: TextStyle(
            color: Colors.deepOrange,
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
          displaySmall: TextStyle(
            color: Colors.grey,
            fontSize: 15,
            fontWeight: FontWeight.w300,
          )

        )
      ),
      routes: {
        '/':(context)=> const MainPageListScreen(title: 'Мое первое приложение'),
        '/service': (context)=> const ServiceScreen()
      },

      //home: const MainPageListScreen(title: 'Мое первое приложение'),
    );
  }
}

class MainPageListScreen extends StatefulWidget {
  const MainPageListScreen({super.key, required this.title});

  final String title;



  @override
  State<MainPageListScreen> createState() => _MainPageListScreenState();
}

class _MainPageListScreenState extends State<MainPageListScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    final double tileHeight =120;
    final double tileWidth =100;
    List <int> exampleList =  [1,2,3,4];
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: Text(widget.title),
      // ),

      body:SafeArea(
        child:
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            IconButton(onPressed: (){},
                icon: const Icon(Icons.arrow_back)
            ),
            IconButton(onPressed: (){},
                icon: const Icon(Icons.keyboard_option_key)
            )
          ]),
            Flexible( //Expanded form whore screen
            child:
            ListView.separated(
              shrinkWrap: true,
                itemCount: 4,
                separatorBuilder: (context,i)=>const Divider(
                  thickness: 3,
                  color: Colors.amber,
                ),
                itemBuilder: (context,i)
                {
                  final int itemNumber = i;
                  return ListTile(
                  leading: SvgPicture.asset(
                    'assets/icon2.svg',
                    height: 35,
                    width:  35,
                  ),
                  trailing:const Icon(Icons.arrow_forward_ios),
                  title: Text(
                    'item $i',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  subtitle: Text(
                      'price',
                      style: Theme.of(context).textTheme.displaySmall,
                  ),
                  onTap: (){
                    Navigator.of(context).pushNamed("/service",arguments: itemNumber);
                  },
                );
                }
            ),
            ),

            Wrap(

              runSpacing: 15,
              spacing: 15,

              children: [

                InkWell(
                    onTap: () => _showToast(context), // Handle your callback
                    child: Ink(
                      height: tileHeight,
                      width: tileWidth,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),

                      ),
                    )
                ),
                InkWell(
                  onTap: () => _showToast(context), // Handle your callback
                  child: Ink(
                  height: tileHeight,
                  width: tileWidth,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),

                )
                ),
                InkWell(
                    onTap: () => _showToast(context), // Handle your callback
                    child: Ink(
                      height: tileHeight,
                      width: tileWidth,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10)
                      ),
                    )
                ),
                InkWell(
                    onTap: () => _showToast(context), // Handle your callback
                    child: Ink(
                      height: tileHeight,
                      width: tileWidth,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10)
                      ),
                    )
                ),
                InkWell(
                    onTap: () => _showToast(context), // Handle your callback
                    child: Ink(
                      height: tileHeight,
                      width: tileWidth,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10)
                      ),
                    )
                ),

              ],

            )
          ],
        ),
      ),
      )


    );
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Added to favorite'),
        action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}


class ServiceScreen extends StatefulWidget{
  const ServiceScreen({super.key});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  int serviceNumber=0;

  @override
  void didChangeDependencies() {

    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is int, 'Object must be provide Int');


    serviceNumber = args as int ;
    setState(() { });

    super.didChangeDependencies();
  }

@override
Widget build(BuildContext context){
  final items = List<Widget>.generate(
    1000,
        (i) => i % 6 == 0
        ? Text('Heading $i')
        : Text('Sender $i'),
  );

    return Scaffold(
      appBar: AppBar(
        title:  Text('This is $serviceNumber' ?? '....'),

      ),

      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        physics: const ScrollPhysics(),
        children: items.map((i) => i).toList()
      ),


    );
}
}