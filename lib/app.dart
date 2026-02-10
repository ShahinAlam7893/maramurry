import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'core/routes/app_router.dart';
import 'core/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'YourGarden',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light, 
      routerConfig: AppRouter.router,
    );
  }
}