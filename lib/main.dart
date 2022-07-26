import 'package:counter/count.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'dart:convert';

dynamic k = 0;
dynamic c,count=0;
void parseInit()async{
  var ipaddress = "http://192.168.1.10:1337/parse";
  await Parse().initialize(
      'myAppId',
      // 'http://localhost:1337/parse',
      ipaddress,
      masterKey: "masterKey",
      clientKey: "clientKey",
      debug: true,
      coreStore: await CoreStoreSharedPrefsImp.getInstance()
  );

  final ParseResponse response = await Parse().healthCheck();
  print(response.toString());
  if (response.success) {
    print("server health check success");
    c = await ParseObject('Counter')
      ..objectId='5oBq0BC3oo';
      // ..set<int>('count',0);
    // var response = await c.save();
    // if (response.success) {
    //   c = response.results?.first;
    //   print("Counter initialised with : ${c.toString()}");
    // }
    count =  c..get<int>('count');
    k = count.toString();
    if(k!=0 && k!=null){
      print("fetch success $k");
    }
    else{
      print("Failed to initialise");
    }
  } else {
    print('Server health check failed');
  }
}

void main() {
  runApp(
      MaterialApp(home: Counter())
  );
}

class Counter extends StatefulWidget {
  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  void initState() {
    super.initState();
    parseInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Counter'),),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add, color: Colors.white,),
        onPressed: ()async{
          // count = await c.increment("count", 1);
          count = c..setIncrement('count', 1);
          var res =await count.save();
          print("incremented : ${res.results.first}");
          // count =  c..get<int>('count');
          (count != 0)? print("Success, incremented!") : print("Failed to increment");
          setState(() {
            k=res.results.first;
            print(k);
          });
        },
      ),
      body: Center(
          child: Text(k.toString(),
            style: const TextStyle(color: Colors.lightBlueAccent,
                fontSize: 70),)
      ),
    );
  }
}

