import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Muestremelo ya a.a"),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 250.0,
                width: 450.0,
                child: Image(
                  image: AssetImage('assets/images/nina.jpg'),
                ),
              ),
              SizedBox(
                height: 250.0,
                width: 450.0,
                child: Image.network(
                  'https://images.unsplash.com/photo-1740564014446-f07ea2da269c?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
