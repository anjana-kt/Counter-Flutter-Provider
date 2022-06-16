import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:counter/count.dart';
import 'package:counter/counter.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
  create: (_) => Count(),
  child: MyApp(),
)
  );
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Counter(),
    );

  }
}
