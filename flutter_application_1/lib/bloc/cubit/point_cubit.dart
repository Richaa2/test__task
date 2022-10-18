import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'point_state.dart';

class PointCubit extends Cubit<PointState> {
  PointCubit() : super(PointInitial());

  var mouth = DateTime.now().month;
  var day = DateTime.now().day;
  var points = PointLoadedState(10, 2, 5);
  // double pointSum = points.pointSum;
  // int pointYesterday = PointLoadedState().pointYesterday;
  // int pointBeforeYesterday = PointLoadedState().pointBeforeYesterday.toInt();
  // DateTime lastUpdate = PointLoadedState().lastUpdate;
  DateTime now = DateTime.now();
  Future updateDay() async {
    // emit(PointInitial());
    if (mouth == 3 && day == 1 ||
        mouth == 6 && day == 1 ||
        mouth == 9 && day == 1 ||
        mouth == 12 && day == 1) {
      points.pointBeforeYesterday = points.pointYesterday;
      points.pointYesterday = points.pointSum.toInt();
      points.pointSum = points.pointSum + 1;
    }
    if (mouth == 3 && day == 2 ||
        mouth == 6 && day == 2 ||
        mouth == 9 && day == 2 ||
        mouth == 12 && day == 2) {
      points.pointBeforeYesterday = points.pointYesterday;
      points.pointYesterday = points.pointSum.toInt();
      points.pointSum = points.pointSum + 2;
    }

    if (day >= 3 &&
        now.difference(points.lastUpdate).inSeconds > 24 * 60 * 60) {
      points.pointBeforeYesterday = points.pointYesterday;
      points.pointYesterday = points.pointSum.toInt();

      points.pointSum =
          points.pointBeforeYesterday + points.pointYesterday * (60 / 100);

      print(points.pointSum);
      points..pointSum = points.pointSum;
    }

    // if (now.difference(lastUpdate).inSeconds > 24 * 60 * 60) {
    //   PointLoadedState().lastUpdate.add(const Duration(hours: 24));

    //   PointLoadedState().pointSum = pointSum += 50;
    //   print(pointSum);
    // }

    emit(points);
  }
}
