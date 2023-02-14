import 'package:flutter/material.dart';

class GListTile extends StatelessWidget {
  const GListTile(
      {super.key,
      required this.icon,
      required this.title,
      this.label = '',
      this.onTap});
  final IconData icon;
  final void Function()? onTap;
  final String title;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon),
      title: Text(title),
      trailing: FittedBox(
        child: Row(
          children: [
            Text(label, style: Theme.of(context).textTheme.titleSmall),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
