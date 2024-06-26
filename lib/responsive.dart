import 'package:flutter/material.dart';

class ResponsivePadding extends StatelessWidget {
  final Widget child;
  const ResponsivePadding({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).size.width > 650
          ? EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 3.5)
          : const EdgeInsets.all(0),
      child: child,
    );
  }
}
