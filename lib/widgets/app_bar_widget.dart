import 'package:flutter/material.dart';

import '../res/colors.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget(
      {required this.title, this.icon, this.onPress, this.child});

  final String title;
  final IconData? icon;
  final Function? onPress;
  final Widget? child;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      automaticallyImplyLeading: true,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Theme.of(context).primaryColor,
      ),
      title: Text(
        title,
        style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
      actions: [
        onPress != null
            ? GestureDetector(
                onTap: () {
                  onPress!();
                },
                child: Icon(
                  icon,
                  color: MyColors.mainColor,
                ),
              )
            : SizedBox(),
      ],
    );
  }
}
