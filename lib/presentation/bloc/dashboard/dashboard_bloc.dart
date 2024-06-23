import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(const DashboardInitial(tabIndex: 0)) {
    on<DashboardEvent>((event, emit) {
      if (event is TabChange) {
        print(event.tabIndex);
        emit(DashboardInitial(tabIndex: event.tabIndex));
      }
    });
  }
}
