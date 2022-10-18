import 'dart:developer' as dev;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/cubit/point_cubit.dart';
import 'package:flutter_application_1/consts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/containers.dart';

class Head extends StatelessWidget {
  const Head({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    int balance = random.nextInt(1500);
    int avaliable = limitBalance - balance;

    Future.delayed(Duration(seconds: 3))
        .then((value) => context.read<PointCubit>().updateDay());
    context.read<PointCubit>().updateDay();

    return Row(
      children: [
        Column(
          children: [
            ContainerSmall(screenSize: screenSize, children: [
              Text('Card Balance'),
              Text(
                '\$$balance',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Text(
                '\$$avaliable Available',
                style: TextStyle(color: Colors.grey),
              )
            ]),
            Divider(
              height: 8,
            ),
            ContainerSmall(screenSize: screenSize, children: [
              Text(
                'Daily Points',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              BlocConsumer<PointCubit, PointState>(
                listener: (context, state) {
                  dev.log(state.toString());
                },
                builder: (context, state) {
                  return Text(
                      state is PointLoadedState ? '${state.pointSum}' : '',
                      style: TextStyle(color: Colors.grey));
                },
              )
            ]),
          ],
        ),
        SizedBox(width: 8),
        ContainerBig(screenSize: screenSize),
      ],
    );
  }
}
