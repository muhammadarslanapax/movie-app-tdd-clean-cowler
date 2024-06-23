import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'choice_event.dart';
part 'choice_state.dart';

class ChoiceBloc extends Bloc<ChoiceEvent, ChoiceState> {
  ChoiceBloc() : super(ChoiceInitial()) {
    on<ChoiceEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
