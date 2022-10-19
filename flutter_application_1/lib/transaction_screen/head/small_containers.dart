import 'dart:math';
import 'dart:developer' as dev;
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/point_cubit/point_cubit.dart';
import '../../consts.dart';

class SmallContainers extends StatelessWidget {
  const SmallContainers({super.key, required this.screenSize});

  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    Random random = Random();
    int balance = random.nextInt(1500);
    int avaliable = limitBalance - balance;
    return Column(
      children: [
        _buildContainer([
          _buildTitle('Card Balance', false),
          _buildBalance(balance),
          _buildAvaliable(avaliable)
        ]),
        _divider(),
        _buildContainer([
          _buildTitle('Daily Points', true),
          _blocConsumer(),
        ]),
        //
      ],
    );
  }

  Text _buildTitle(String name, bool style) => Text(name,
      style:
          style == true ? const TextStyle(fontWeight: FontWeight.bold) : null);

  BlocConsumer<PointCubit, PointState> _blocConsumer() {
    return BlocConsumer<PointCubit, PointState>(
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
          //round sum
          int sum;
          String sumString;
          state.pointSum > 1000
              ? sum = (state.pointSum / 1000.0).round() * 1000
              : sum = state.pointSum;

          sum >= 1000
              ? sumString = '${(sum / 1000).round()}K'
              : sumString = sum.toString();
          return Text(sumString, style: const TextStyle(color: Colors.grey));
        }
        return const Text('');
      },
    );
  }

  Text _buildAvaliable(int avaliable) {
    return Text(
      '\$$avaliable Available',
      style: const TextStyle(color: Colors.grey),
    );
  }

  Text _buildBalance(int balance) {
    return Text(
      '\$$balance',
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    );
  }

  Divider _divider() {
    return const Divider(
      height: 8,
    );
  }

  Container _buildContainer(List<Widget> children) {
    return Container(
      decoration:
          BoxDecoration(color: white, borderRadius: BorderRadius.circular(15)),
      width: screenSize.width / 2 - 30,
      height: heightContainer,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children),
      ),
    );
  }
}
