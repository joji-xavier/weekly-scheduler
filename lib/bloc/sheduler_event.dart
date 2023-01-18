part of 'sheduler_bloc.dart';

@immutable
abstract class ShedulerEvent {}

class CheckBoxEvent extends ShedulerEvent {
  final int index;
  CheckBoxEvent({
    required this.index,
  });
}

class CustomButtonPressed extends ShedulerEvent {
  final String buttonName;
  final int index;
  CustomButtonPressed({
    required this.buttonName,
    required this.index,
  });
}

class Interpretation extends ShedulerEvent {
  final List<Map<String, dynamic>> shedules;
  Interpretation({
    required this.shedules,
  });
}
