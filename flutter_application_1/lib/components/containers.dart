import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../consts.dart';

class ContainerSmall extends StatelessWidget {
  const ContainerSmall({
    Key? key,
    required this.screenSize,
    required this.children,
  }) : super(key: key);

  final Size screenSize;

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children),
      ),
      decoration:
          BoxDecoration(color: white, borderRadius: BorderRadius.circular(15)),
      width: screenSize.width / 2 - 30,
      height: heightContainer,
    );
  }
}

class ContainerBig extends StatelessWidget {
  const ContainerBig({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    var date = DateFormat.MMMM().format(DateTime.now());

    return Container(
      decoration:
          BoxDecoration(color: white, borderRadius: BorderRadius.circular(15)),
      width: screenSize.width / 2 - 30,
      height: heightContainer * 2 + 8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('No Payment Due'),
          Text(
            'You’ve paid your $date balance',
            style: TextStyle(color: Colors.grey),
          ),
          Spacer(),
          Row(
            children: [
              Spacer(),
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey.shade300,
                child: Icon(
                  Icons.check,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
