import 'package:flutter/material.dart';
import 'package:noteapp/widgets/CustomIcon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, required this.title, required this.icon, this.onPressed});

  final String title;
  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 28),
        ),
        Spacer(),
        //Search ICON
        customIcon(
          icon: icon,
          onPressed: onPressed,
        )
      ],
    );
  }
}
