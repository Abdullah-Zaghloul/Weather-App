import 'package:flutter/material.dart';

class DefaultPage extends StatelessWidget {
  const DefaultPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'there is no weather data😔',
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
