import 'package:flutter/material.dart';
import 'package:goindiastocks_task/network/network_connection.dart';
import 'package:goindiastocks_task/screens/home_screen/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => NetworkConnection(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          scaffoldBackgroundColor: const Color(0xFFEBEDF0),
          appBarTheme: const AppBarTheme(color: Color(0xFFEBEDF0)),
          textTheme: const TextTheme(
            bodyMedium: TextStyle(
              fontSize: 15.0,
              color: Colors.blueAccent,
            ),
            bodySmall: TextStyle(
              fontSize: 12.0,
              color: Colors.white,
            ),
          ),
        ),
        home: const HomeScreen(),
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
        },
      ),
    );
  }
}
