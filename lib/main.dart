import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => CustomDialog(
                      title: 'Here our output',
                    ));
          },
          child: Text("Click here"),
        ),
      ),
    );
  }
}

class CustomDialog extends StatefulWidget {
  final String title;
  CustomDialog({required this.title});

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  final textController = TextEditingController();
  final List<String> entries = [];
  bool _isEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 400,
          width: 600,
          decoration: BoxDecoration(),
          child: Column(
            children: [
              TextField(
                controller: textController,
              ),
              SizedBox(
                height: 35,
              ),
              InkWell(
                onTap: () {
                  setState(
                    () {
                      entries.add(textController.text);
                    },
                  );
                },
                child: Text(
                  "Save",
                  style: TextStyle(fontSize: 28, color: Colors.tealAccent),
                ),
              ),
              Text(
                widget.title,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 15,
              ),
              ...entries.map(
                (e) => Text(e),
              ),
              Align(
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Ok"),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
