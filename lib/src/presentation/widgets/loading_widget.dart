import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      color: const Color.fromARGB(126, 0, 0, 0),
      child: Center(child: CircularProgressIndicator.adaptive()),
    );
  }
}