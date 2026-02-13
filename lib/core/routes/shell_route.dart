import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../constants/app_colors.dart';
import '../widgets/app_bottom_nav_bar.dart';
import '../widgets/app_drawer.dart';

class AppShell extends StatefulWidget {
  final Widget child;

  const AppShell({
    super.key,
    required this.child,
  });

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _getIndexFromRoute(BuildContext context) {
    final path = GoRouterState.of(context).uri.path;
    return switch (path) {
      '/home' => 0,
      '/explore' => 1,
      '/schedule' => 2,
      '/projects' => 3,
      '/profile' => 4,
      _ => 0,
    };
  }

  void _onNavBarTap(int index) {
    const routes = ['/home', '/explore', '/schedule', '/projects', '/profile'];
    context.go(routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _getIndexFromRoute(context);

    return Scaffold(
      drawer: const AppDrawer(),
      body: widget.child,
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: currentIndex,
        onTap: _onNavBarTap,
      ),
    );
  }
}