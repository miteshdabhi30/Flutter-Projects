import 'package:flutter/material.dart';

class RequestAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RequestAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("My Request"),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
