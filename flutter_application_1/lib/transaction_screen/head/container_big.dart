import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../consts.dart';

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
          const Text('No Payment Due'),
          Text(
            'You’ve paid your $date balance',
            style: const TextStyle(color: Colors.grey),
          ),
          const Spacer(),
          Row(
            children: [
              const Spacer(),
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey.shade300,
                child: const Icon(
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
