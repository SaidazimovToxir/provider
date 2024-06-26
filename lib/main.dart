import 'package:flutter/material.dart';
import 'package:lesson_64/controllers/card_controllers.dart';
import 'package:lesson_64/views/screens/home_screen.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) {
          return CartController();
        }),
      ],
      builder: (context, child) {
        return MaterialApp(
          darkTheme: ThemeData.dark(),
          debugShowCheckedModeBanner: false,
          home: ProductsScreen(),
        );
      },
    );
  }
}
