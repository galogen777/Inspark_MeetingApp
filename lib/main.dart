import 'package:flutter/material.dart';
import 'features/service_list/widgets/widgets.dart';
import 'features/service_list/view/view.dart';
import 'router/router.dart';

import 'theme/theme.dart';

void main() {
  runApp(const MeetingRoomMananger());
}

class MeetingRoomMananger extends StatelessWidget {
  const MeetingRoomMananger({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TEST',
      theme: themeMain,
      routes: routes,

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
    const double tileHeight = 120;
    const double tileWidth = 100;
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
        // appBar: AppBar(
        //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        //   title: Text(widget.title),
        // ),

        body: SafeArea(

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            const ServiceFindRowWidget(),
            const MeetingsListWidget(),
            Expanded(child: MainButtonsWidget(buttonItems: buttonItems),

            )



          ],

        ),


      ),
    ));
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Added to favorite'),
        action: SnackBarAction(
            label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}

class MeetingsListWidget extends StatelessWidget {
  const MeetingsListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(

          //Expanded form whore screen
          child: ListView.separated(
              shrinkWrap: true,
              itemCount: 4,

              separatorBuilder: (context, i) => const Divider(
                    thickness: 3,
                    color: Colors.amber,
                  ),
              itemBuilder: (context, i) {
                return ListTileWidget(itemNumber: i);
              }),
        ),
      ],
    );
  }
}
