import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:counter/count.dart';
import 'package:counter/counter.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Count()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Counter(),
    );

  }
}