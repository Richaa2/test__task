import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'point_state.dart';

class PointCubit extends Cubit<PointState> {
  PointCubit() : super(PointInitial());
//TODO перевірити як буде з 1 дня пори року потім доробити дизайн і чистити далі

  var points = PointLoadedState(0, 100, 300);

  Future updateDay() async {
    DateTime now = DateTime.now();
    var mouth = DateTime.now().month;
    var day = DateTime.now().day;
    print(now.difference(points.lastUpdate).inDays);
    if (now.difference(points.lastUpdate).inDays >= 1 && day < 3) {
      points.lastUpdate = now;
      if (mouth == 3 && day == 1 ||
          mouth == 6 && day == 1 ||
          mouth == 9 && day == 1 ||
          mouth == 12 && day == 1) {
        points.pointSum = points.pointSum + 1;
      }
      if (mouth == 3 && day == 2 ||
          mouth == 6 && day == 2 ||
          mouth == 9 && day == 2 ||
          mouth == 12 && day == 2) {
        points.pointSum = points.pointSum + 2;
      }
    }

    if (day >= 3 && now.difference(points.lastUpdate).inDays >= 1) {
      var percetage = ((60 / 100) * points.pointYesterday);
      points.pointSum = percetage.toInt() + points.pointBeforeYesterday;
      // points.lastUpdate = now;

      print(points.pointSum);
    }

    points.pointBeforeYesterday = points.pointYesterday;
    points.pointYesterday = points.pointSum.toInt();

    // print(points.pointBeforeYesterday);
    // print(points.pointYesterday);
    // print(points.pointSum);

    emit(points);
  }
}
