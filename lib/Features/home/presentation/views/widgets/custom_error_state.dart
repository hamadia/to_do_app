import 'package:flutter/material.dart';

class ErrorState extends StatelessWidget {
  const ErrorState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text('Something went wrong'),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Try again'),
          ),
        ],
      ),
    );
  }
}
