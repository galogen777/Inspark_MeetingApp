import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainButtonsWidget extends StatelessWidget {
  const MainButtonsWidget({
    super.key,
    required this.buttonItems,
  });

  final List<Widget> buttonItems;

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
            physics: const ScrollPhysics(),
            scrollDirection: Axis.vertical,

            child:
            Wrap(
              runSpacing: 10,
              spacing: 10,
              children:
              buttonItems.map((i) => i).toList(),
            )
        );

  }
}

