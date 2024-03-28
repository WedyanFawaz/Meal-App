import 'package:flutter/material.dart';

class SwitchItem extends StatelessWidget {
  const SwitchItem(
      {Key? key,
      required this.xfreeName,
      required this.xFree,
      required this.onChanged,
      required this.xFreeSubtitle})
      : super(key: key);

  final String xfreeName;
  final bool xFree;
  final String xFreeSubtitle;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: xFree,
      onChanged: onChanged,
      title: Text(
        xfreeName,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      subtitle: Text(
        xFreeSubtitle,
        style: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: EdgeInsets.only(left: 34, right: 34),
    );
  }
}
