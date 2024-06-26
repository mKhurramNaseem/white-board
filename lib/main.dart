import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:white_board/pages/home_page.dart';
import 'package:white_board/theme/app_color_scheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const appTitle = 'White Board';
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: appTitle,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColorScheme.seed,
            primary: AppColorScheme.primary,
            secondary: AppColorScheme.secondary,
            tertiary: AppColorScheme.tertiary,
          ),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
