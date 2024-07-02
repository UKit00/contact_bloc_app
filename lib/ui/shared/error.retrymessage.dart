import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ErrorRetryMessage extends StatelessWidget {
  String errorMessage;
  var onAction;

  ErrorRetryMessage({required this.errorMessage, required this.onAction});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(errorMessage),
        ElevatedButton(
          onPressed: onAction,
          child: Text("Retry"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepOrange,
            foregroundColor: Colors.white,
            //textStyle: TextStyle(color: Colors.white, ),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0), // Rounded corners
            ),
          ),
        ),
      ],
    );
    ;
  }
}
