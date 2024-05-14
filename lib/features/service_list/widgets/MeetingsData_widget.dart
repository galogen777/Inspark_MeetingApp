import 'package:flutter/material.dart';


/// The base class for the different types of items the list can contain.
abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  Widget buildSubtitle(BuildContext context);
}

/// A ListItem that contains data to display a heading.
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  @override
  Widget buildTitle(BuildContext context) {
    return
      Text(
            heading,
            style: Theme.of(context).textTheme.headlineMedium
      );

  }

  //@override
  Widget buildSubtitle(BuildContext context) => const SizedBox.shrink();
}

/// A ListItem that contains data to display a message.
class MessageItem implements ListItem {
  final String sender;
  final String body;
  final bool busy;

  MessageItem(this.sender, this.body,this.busy);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(sender,
      style: this.busy
          ? Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.redAccent)
          : Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.green)
    );
  }

  @override
  Widget buildSubtitle(BuildContext context) {
    return Text(body,
            style: Theme.of(context).textTheme.bodySmall

    );
  }
}