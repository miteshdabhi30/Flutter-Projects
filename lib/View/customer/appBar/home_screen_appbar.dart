import 'package:flutter/material.dart';

import '../../../repository/shared_preference_helper/shared_preference_helper.dart';

class HomeScreenAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeScreenAppBar({super.key});

  @override
  State<HomeScreenAppBar> createState() => _HomeScreenAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _HomeScreenAppBarState extends State<HomeScreenAppBar> {
  final SharedPreferenceHelper _sharedPreferenceHelper =
      SharedPreferenceHelper();
  String? email;
  String? name;

  @override
  void initState() {
    super.initState();
    _loadCredential();
  }

  Future<void> _loadCredential() async {
    Map<String, dynamic> credential =
        await _sharedPreferenceHelper.loadCredential();
    setState(() {
      email = credential['email'];
      name = credential['name'];

    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Welcome, $name"),
      forceMaterialTransparency: true,
    );
  }

  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
