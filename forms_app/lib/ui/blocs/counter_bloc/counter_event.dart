part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class CounterIncrement extends CounterEvent {
  final int value;

  const CounterIncrement(this.value);
}

class CounterReset extends CounterEvent {
  const CounterReset();
}
