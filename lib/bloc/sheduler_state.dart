part of 'sheduler_bloc.dart';

class ShedulerState {
  final bool checkBoxChecked;
  final Set<String> buttonNames;
  final int index;
  final Set<int> selectedIndex;
  final String summary;
  final List<Map<String, dynamic>> shedules;
  ShedulerState({
    required this.checkBoxChecked,
    required this.buttonNames,
    required this.index,
    required this.selectedIndex,
    required this.summary,
    required this.shedules,
  });
}

class InitialState extends ShedulerState {
  InitialState()
      : super(
            index: 0,
            checkBoxChecked: false,
            buttonNames: {},
            selectedIndex: {},
            summary: "Hi Jose Mark Your Availablity For This Week",
            shedules: [{}]);
}
