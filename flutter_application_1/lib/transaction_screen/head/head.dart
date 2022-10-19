import 'package:flutter/material.dart';

import 'package:flutter_application_1/transaction_screen/head/small_containers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/point_cubit/point_cubit.dart';
import 'container_big.dart';

class Head extends StatelessWidget {
  const Head({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    context.read<PointCubit>().updateDay();

    return Row(
      children: [
        SmallContainers(screenSize: screenSize),
        const SizedBox(width: 8),
        ContainerBig(screenSize: screenSize),
      ],
    );
  }
}
