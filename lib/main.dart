import 'package:flutter/material.dart';

import 'generic_method.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Sample<String> sample = Sample<String>();
  final Sample<Duration> sample1 = Sample<Duration>();

  final Person<Police> person1 = Person<Police>(age: 30, height: 175.1);
  final Person<Marketer> person2 = Person<Marketer>(age: 31, height: 165.0);

  final Police police = Police('seoul', '10');
  final Marketer marketer = Marketer('jeju', 10000000);

  Future<String> getLocation() async {
    return await person1.sendGetLocation(person1.moreInfo!);
  }

  @override
  Widget build(BuildContext context) {
    person1.setMoreInfo(police);
    person2.setMoreInfo(marketer);

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Text(sample.getValue()),
              Text(sample1.getValue()),
              const Divider(),
              Text(person1.moreInfo.toString()),
              Text(person2.moreInfo.toString()),
              const Divider(),
              FutureBuilder(
                builder: (context, snapshot) => Text(snapshot.data.toString()),
                future: getLocation(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
