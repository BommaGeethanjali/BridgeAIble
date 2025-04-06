import 'package:flutter/material.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  const Navbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue, // Updated background color from the first Navbar
      elevation: 2,
      title: const Text('Sign Recognition', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)), // Updated title from the first Navbar
      actions: [
        MediaQuery.of(context).size.width > 600
            ? Row(
          children: [
            _navItem(context, 'Home', '/'),
            _navItem(context, 'Recognition', '/recognition'),
            _navItem(context, 'Translation', '/translation'),
            _navItem(context, 'About', '/about'),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/get_started'),
              child: const Text('Get Started', style: TextStyle(color: Colors.white)), // Adjusted color for visibility on blue background
            ),
            const SizedBox(width: 16),
          ],
        )
            : IconButton(
          icon: const Icon(Icons.menu, color: Colors.white), // Adjusted color for visibility on blue background
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ],
    );
  }

  Widget _navItem(BuildContext context, String title, String route) {
    return TextButton(
      onPressed: () => Navigator.pushNamed(context, route),
      child: Text(
        title,
        style: TextStyle(
          color: ModalRoute.of(context)?.settings.name == route ? Colors.white : Colors.white70, // Adjusted colors for visibility on blue background
          fontSize: 16,
        ),
      ),
    );
  }
}

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue), // Matched the color with the Navbar
            child: Text('Sign Recognition', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)), // Updated title to match Navbar
          ),
          ListTile(title: const Text('Home'), onTap: () => Navigator.pushNamed(context, '/')),
          ListTile(title: const Text('Recognition'), onTap: () => Navigator.pushNamed(context, '/recognition')),
          ListTile(title: const Text('Translation'), onTap: () => Navigator.pushNamed(context, '/translation')),
          ListTile(title: const Text('About'), onTap: () => Navigator.pushNamed(context, '/about')),
          ListTile(
            title: const Text('Get Started'),
            onTap: () {
              Navigator.pushNamed(context, '/get_started');
              Navigator.pop(context); // Close drawer
            },
          ),
        ],
      ),
    );
  }
}