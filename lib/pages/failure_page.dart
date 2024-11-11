import 'package:flutter/material.dart';

class FailurePage extends StatelessWidget {
  const FailurePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Something went wrong please try again',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            'searching now🔍',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}

