import 'package:bloc/bloc.dart';
import 'counter_events.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncrements>((event, emit) => emit(state + 1));
  }
}