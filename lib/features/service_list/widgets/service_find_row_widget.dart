import 'package:flutter/material.dart';

class ServiceFindRowWidget extends StatelessWidget {
  const ServiceFindRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
      IconButton(
          onPressed: () {}, icon: const Icon(Icons.keyboard_option_key))
          ]);
  }
}