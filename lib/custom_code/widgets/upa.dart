// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class Upa extends StatefulWidget {
  const Upa({
    Key? key,
    this.width,
    this.height,
    this.action,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Future<dynamic>? Function()? action;

  @override
  _UpaState createState() => _UpaState();
}

class _UpaState extends State<Upa> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        if (widget.action != null) {
          await widget.action!();
        }
        setState(() {
          FFAppState().isfaavorit.toString();
        });
      },
      child: Text('Hello'),
    );
  }
}
