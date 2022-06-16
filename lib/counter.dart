import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:counter/count.dart';

class Counter extends StatelessWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Counter'),),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white,),
        onPressed: (){
          Provider.of<Count>(context,listen: false).add();
        },

      ),
      body: Container(
        child: Text('Counting... ${Provider.of<Count>(context,listen: true).count}')
      ),
    );
  }
}
