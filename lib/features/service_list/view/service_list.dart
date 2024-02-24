
import 'package:flutter/material.dart';


class ServiceListScreen extends StatefulWidget{
  const ServiceListScreen({super.key});

  @override
  State<ServiceListScreen> createState() => _ServiceListScreenState();
}

class _ServiceListScreenState extends State<ServiceListScreen> {
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
      60,
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
          shrinkWrap: true,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 3,
          physics: const ScrollPhysics(),
          children: items.map((i) => i).toList()
      ),


    );
  }
}