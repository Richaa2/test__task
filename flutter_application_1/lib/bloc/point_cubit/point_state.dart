part of 'point_cubit.dart';

@immutable
abstract class PointState {}

class PointInitial extends PointState {}

// ignore: must_be_immutable
class PointLoadedState extends PointState {
  // ignore: prefer_const_constructors
  DateTime lastUpdate = DateTime.now().subtract(Duration(hours: 24));
  int pointSum;
  int pointYesterday;
  int pointBeforeYesterday;

  PointLoadedState(
    this.pointSum,
    this.pointYesterday,
    this.pointBeforeYesterday,
  );
}
