import 'package:flutter/material.dart';

class MadeByWidget extends StatelessWidget {
  const MadeByWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            "Dibuat oleh Tholut Akhyar NIM: 21201040",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
