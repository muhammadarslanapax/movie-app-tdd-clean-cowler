part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardEvent {}

class TabChange extends DashboardEvent {
  final int tabIndex;

  TabChange({required this.tabIndex});
}
