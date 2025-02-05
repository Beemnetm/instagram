import 'package:flutter/material.dart';
import 'package:instagram/post/presentation/components/my_drawer_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 100),
            Icon(
              Icons.person,
              size: 60,
            ),
            Divider(
              color: Theme.of(context).colorScheme.tertiary,
            ),
            MyDrawerTile(title: "H O M E", icon: Icons.home, onTap: () {}),
            Divider(
              color: Theme.of(context).colorScheme.tertiary,
            ),
            MyDrawerTile(
                title: "P R O F I L E", icon: Icons.person, onTap: () {}),
            Divider(
              color: Theme.of(context).colorScheme.tertiary,
            ),
            MyDrawerTile(
                title: "S E A R C H", icon: Icons.search, onTap: () {}),
            Divider(
              color: Theme.of(context).colorScheme.tertiary,
            ),
            MyDrawerTile(
                title: "S E T T I N G", icon: Icons.settings, onTap: () {}),
            Spacer(),
            MyDrawerTile(
                title: "L O G O U T", icon: Icons.logout, onTap: () {}),
          ],
        ),
      ),
    );
  }
}
