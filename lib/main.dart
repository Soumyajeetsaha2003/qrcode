import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'qrcode',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    
    home:  const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super. key}) ;
  @override
  State<MyHomePage> createState() => _MyHomePageState() ;
}


class _MyHomePageState extends State<MyHomePage> {
  static const scanChannel = MethodChannel("scanPlatform");

  @override
  Widget build (BuildContext context) {
    return SafeArea(
      child: Center(
      child: TextButton(
        onPressed:( ) async {
          try {
            final String result= await scanChannel.invokeMethod( 'scan');
            setState(() {
              debugPrint("Flutter $result");
            });
          } on PlatformException catch (e) {
            debugPrint ("Fail: '${e.message}'.");
          }
        },
          child: const Text ("Scan QR")),
    )); // TextButton
  }
}
