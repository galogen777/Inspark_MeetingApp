
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    super.key,
    required this.itemNumber,
  });

  final int itemNumber;

  @override
  Widget build(BuildContext context) {
    return ListTile(

      leading: SvgPicture.asset(
        'assets/icon2.svg',
        height: 35,
        width: 35,
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      title: Text(
        'item $itemNumber',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      subtitle: Text(
        'price',
        style: Theme.of(context).textTheme.displaySmall,
      ),
      onTap: () {
        Navigator.of(context)
            .pushNamed("/service", arguments: itemNumber);
      },
    );
  }
}