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
                  if (state is PointLoadedState &&
                      DateTime.now().difference(state.lastUpdate).inSeconds >
                          24 * 60 * 60) {
                    context.read<PointCubit>().updateDay();
                  }
                },
                builder: (context, state) {
                  if (state is PointLoadedState) {
                    int sum;
                    state.pointSum > 1000
                        ? sum = (state.pointSum / 1000.0).round() * 1000
                        : sum = state.pointSum;
                    String sumString;
                    sum >= 1000
                        ? sumString = (sum / 1000).round().toString() + 'K'
                        : sumString = sum.toString();
                    return Text('${sumString}',
                        style: TextStyle(color: Colors.grey));
                  }
                  return Text('');
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
