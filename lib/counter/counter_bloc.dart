import 'package:bloc/bloc.dart';
import 'counter_events.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncrement>((event, emit) => emit(state + 1));
    on<CounterDecrement>((event, emit) => emit(state - 1));
    on<CounterReset>((event, emit) => emit(0));
  }
}