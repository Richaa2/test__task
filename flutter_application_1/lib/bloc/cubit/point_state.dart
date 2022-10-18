part of 'point_cubit.dart';

@immutable
abstract class PointState {}

class PointInitial extends PointState {}

class PointLastUpdateState extends PointState {}

class PointLoadedState extends PointState {
  DateTime lastUpdate = DateTime.now().subtract(Duration(hours: 24));
  int pointSum;
  int pointYesterday;
  int pointBeforeYesterday;

  PointLoadedState(
      this.pointSum, this.pointYesterday, this.pointBeforeYesterday);
}
