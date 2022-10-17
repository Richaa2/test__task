import 'package:flutter/material.dart';

import 'components/containers.dart';

class Head extends StatelessWidget {
  const Head({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            ContainerSmall(screenSize: screenSize, children: [
              Text('Card Balance'),
              Text('\$17.30'),
              Text('\$1,482.70 Available')
            ]),
            Divider(
              height: 8,
            ),
            ContainerSmall(
                screenSize: screenSize,
                children: [Text('Daily Points'), Text('456K')]),
          ],
        ),
        SizedBox(width: 8),
        ContainerBig(screenSize: screenSize),
      ],
    );
  }
}
