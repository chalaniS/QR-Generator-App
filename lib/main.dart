import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_generator_app/ui/style/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String data = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: QrImage(
              data: data,
              version: QrVersions.auto,
              backgroundColor: Colors.white,
              size: 300.0,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Container(
            width: 300.0,
            child: TextField(
              //generate qr code when input value change

              onChanged: (value) {
                setState(() {
                  data = value;
                });
              },

              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                  fillColor: AppStyle.textInputColor,
                  hintText: "Type the data",
                  filled: true,
                  border: InputBorder.none),
            ),
          ),
          SizedBox(
            height: 24.0,
          ),
        ],
      ),
    );
  }
}
