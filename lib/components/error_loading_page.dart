import 'package:flutter/material.dart';

import '../utils/theme/colors.dart';

class ErrorLoadingPage extends StatelessWidget {
  final void Function()? onPressed;

  const ErrorLoadingPage({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Failed to get tv show data',
            style: TextStyle(color: colorYellow),
          ),
          TextButton(onPressed: () => onPressed, child: const Text('Try again')),
        ],
      ),
    );
  }
}
