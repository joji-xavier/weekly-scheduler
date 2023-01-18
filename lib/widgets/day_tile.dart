import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weekly_scheduler/bloc/sheduler_bloc.dart';

class DayTile extends StatelessWidget {
  final String day;

  final int index;

  const DayTile({
    Key? key,
    required this.day,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final availablilityEvent = BlocProvider.of<ShedulerBloc>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<ShedulerBloc, ShedulerState>(
          builder: (context, state) {
            return InkWell(
              onTap: () {
                availablilityEvent.add(CheckBoxEvent(index: index));
              },
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: state.selectedIndex.contains(index)
                      ? Colors.green
                      : Colors.grey,
                ),
                child: const Center(
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 20.0,
                  ),
                ),
              ),
            );
          },
        ),
        Text(
          day,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 5,
        ),
        BlocBuilder<ShedulerBloc, ShedulerState>(
          builder: (context, state) {
            Map<String, dynamic> scheduleDetails = {};
            List<Map<String, dynamic>> filteredSchedules = state.shedules
                .where((schedule) => schedule["index"] == index)
                .toList();
            if (filteredSchedules.isNotEmpty) {
              scheduleDetails = filteredSchedules.first;
            }

            return Visibility(
              visible: state.selectedIndex.contains(index),
              child: GestureDetector(
                  onTap: () {
                    availablilityEvent.add(CustomButtonPressed(
                        buttonName: 'Morning', index: index));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: state.selectedIndex.contains(index) &&
                                    scheduleDetails['Morning']
                                ? Colors.deepPurple
                                : Colors.grey,
                            width: 2)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Morning',
                          style: TextStyle(
                              fontSize: 15,
                              color: state.selectedIndex.contains(index) &&
                                      scheduleDetails['Morning']
                                  ? Colors.deepPurple
                                  : Colors.grey),
                        ),
                      ),
                    ),
                  )),
            );
          },
        ),
        BlocBuilder<ShedulerBloc, ShedulerState>(
          builder: (context, state) {
            Map<String, dynamic> scheduleDetails = {};
            List<Map<String, dynamic>> filteredSchedules = state.shedules
                .where((schedule) => schedule["index"] == index)
                .toList();
            if (filteredSchedules.isNotEmpty) {
              scheduleDetails = filteredSchedules.first;
            }
            return Visibility(
              visible: state.selectedIndex.contains(index),
              child: GestureDetector(
                  onTap: () {
                    availablilityEvent.add(CustomButtonPressed(
                        buttonName: 'Afternoon', index: index));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: state.selectedIndex.contains(index) &&
                                    scheduleDetails['Afternoon']
                                ? Colors.deepPurple
                                : Colors.grey,
                            width: 2)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Afternoon',
                          style: TextStyle(
                              fontSize: 15,
                              color: state.selectedIndex.contains(index) &&
                                      scheduleDetails['Afternoon']
                                  ? Colors.deepPurple
                                  : Colors.grey),
                        ),
                      ),
                    ),
                  )),
            );
          },
        ),
        BlocBuilder<ShedulerBloc, ShedulerState>(
          builder: (context, state) {
            Map<String, dynamic> scheduleDetails = {};
            List<Map<String, dynamic>> filteredSchedules = state.shedules
                .where((schedule) => schedule["index"] == index)
                .toList();
            if (filteredSchedules.isNotEmpty) {
              scheduleDetails = filteredSchedules.first;
            }
            return Visibility(
              visible: state.selectedIndex.contains(index),
              child: GestureDetector(
                  onTap: () {
                    availablilityEvent.add(CustomButtonPressed(
                        buttonName: 'Evening', index: index));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: state.selectedIndex.contains(index) &&
                                    scheduleDetails['Evening']
                                ? Colors.deepPurple
                                : Colors.grey,
                            width: 2)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Evening',
                          style: TextStyle(
                              fontSize: 15,
                              color: state.selectedIndex.contains(index) &&
                                      scheduleDetails['Evening']
                                  ? Colors.deepPurple
                                  : Colors.grey),
                        ),
                      ),
                    ),
                  )),
            );
          },
        ),
        BlocBuilder<ShedulerBloc, ShedulerState>(
          builder: (context, state) {
            return Visibility(
                visible: !state.selectedIndex.contains(index),
                child: const Text(
                  'Unavailable',
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ));
          },
        )
      ],
    );
  }
}
