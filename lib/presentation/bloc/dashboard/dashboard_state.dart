part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardState {
  final int tabIndex;

  const DashboardState({required this.tabIndex});
}

class DashboardInitial extends DashboardState {
  const DashboardInitial({required super.tabIndex});
}
