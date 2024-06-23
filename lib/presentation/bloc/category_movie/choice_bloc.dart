import 'package:bloc/bloc.dart';

class ChoiceBloc extends Cubit<int> {
  ChoiceBloc() : super(0);

  void selectChoice(int index) {
    emit(index);
  }
}
