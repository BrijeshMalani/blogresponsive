import 'package:flutter/material.dart';

class BoxContainer extends StatelessWidget {
  final Widget child;

  const BoxContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(MediaQuery.of(context).size.width / 200),
        ),
      ),
      child: child,
    );
  }
}
