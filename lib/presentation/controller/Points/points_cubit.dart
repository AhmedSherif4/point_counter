import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../Application/app_preferences.dart';

part 'points_state.dart';

class PointsCubit extends Cubit<PointsState> {
  final AppPreferences _appPreferences;

  PointsCubit(this._appPreferences) : super(PointsInitial());


  List<int> listOfPointsPlayer1 = [];
  int totalPlayer1 = 0;
  List<int> listOfPointsPlayer2 = [];
  int totalPlayer2 = 0;
  double  limitPoints =100.0;

  setLimitPoints(double newLimitPoints){
    _appPreferences.setLimitPoints(newLimitPoints);
    limitPoints = _appPreferences.getLimitPoints();
   emit(ChangeLimitPoints());
  }


  void addNewPointForPlayer1(int newPointForPlayer1) {
    listOfPointsPlayer1.add(newPointForPlayer1);
    totalPlayer1 += newPointForPlayer1;
    emit(AddNewPointForPlayer1());
  }
  void addNewPointForPlayer2(int newPointForPlayer2) {
    listOfPointsPlayer2.add(newPointForPlayer2);
    totalPlayer2 += newPointForPlayer2;
    emit(AddNewPointForPlayer2());
  }

  void resetPoints(BuildContext context){
    listOfPointsPlayer1.clear();
    totalPlayer1 = 0;
    listOfPointsPlayer2.clear();
    totalPlayer2 = 0;
    Navigator.pop(context);
    emit(ResetPoints());
  }


}
