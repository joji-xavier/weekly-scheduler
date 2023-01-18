import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sheduler_event.dart';
part 'sheduler_state.dart';

class ShedulerBloc extends Bloc<ShedulerEvent, ShedulerState> {
  ShedulerBloc() : super(InitialState()) {
    on<CheckBoxEvent>((event, emit) {
      if (state.selectedIndex.contains(event.index)) {
        Map<String, dynamic> scheduleToUpdate = state.shedules
            .firstWhere((schedule) => schedule['index'] == event.index);
        scheduleToUpdate['Morning'] = false;

        scheduleToUpdate['Afternoon'] = false;
        scheduleToUpdate['Evening'] = false;
        return emit(ShedulerState(
          summary: state.summary,
          index: state.index,
          shedules: state.shedules,
          checkBoxChecked: false,
          buttonNames: state.buttonNames,
          selectedIndex: state.selectedIndex..remove(event.index),
        ));
      } else {
        return emit(ShedulerState(
          summary: state.summary,
          index: state.index,
          shedules: state.shedules
            ..add({
              "index": event.index,
              "Morning": false,
              "Afternoon": false,
              "Evening": false
            }),
          checkBoxChecked: true,
          buttonNames: state.buttonNames,
          selectedIndex: state.selectedIndex..add(event.index),
        ));
      }
    });

    on<CustomButtonPressed>((event, emit) {
      Map<String, dynamic> scheduleToUpdate = state.shedules
          .firstWhere((schedule) => schedule['index'] == event.index);
      scheduleToUpdate['Morning'] = event.buttonName == 'Morning'
          ? !scheduleToUpdate['Morning']
          : scheduleToUpdate['Morning'];
      scheduleToUpdate['Afternoon'] = event.buttonName == 'Afternoon'
          ? !scheduleToUpdate['Afternoon']
          : scheduleToUpdate['Afternoon'];
      scheduleToUpdate['Evening'] = event.buttonName == 'Evening'
          ? !scheduleToUpdate['Evening']
          : scheduleToUpdate['Evening'];
      if (state.buttonNames.contains(event.buttonName) &&
          state.selectedIndex.contains(event.index)) {
        return emit(ShedulerState(
            summary: state.summary,
            shedules: state.shedules,
            checkBoxChecked: state.checkBoxChecked,
            index: event.index,
            buttonNames: state.buttonNames..remove(event.buttonName),
            selectedIndex: state.selectedIndex));
      } else {
        return emit(ShedulerState(
            summary: state.summary,
            shedules: state.shedules,
            checkBoxChecked: state.checkBoxChecked,
            index: event.index,
            buttonNames: state.buttonNames..add(event.buttonName),
            selectedIndex: state.selectedIndex));
      }
    });

    on<Interpretation>((event, emit) {
      final List<Map<String, dynamic>> filteredSchedules =
          state.shedules.where((schedule) => schedule.isNotEmpty).toList();
      final summery = getAvailableTime(filteredSchedules);

      return emit(ShedulerState(
          summary: summery.isNotEmpty ? summery : state.summary,
          shedules: filteredSchedules,
          checkBoxChecked: state.checkBoxChecked,
          index: state.index,
          buttonNames: state.buttonNames,
          selectedIndex: state.selectedIndex));
    });
  }
  String getAvailableTime(List<Map<String, dynamic>> schedules) {
    final Map<String, List<String>> availableTime = {
      "Sunday": [],
      "Monday": [],
      "Tuesday": [],
      "Wednesday": [],
      "Thursday": [],
      "Friday": [],
      "Saturday": []
    };

    for (var schedule in schedules) {
      if (schedule.isNotEmpty) {
        final int index = schedule["index"];
        final String day = [
          "Sunday",
          "Monday",
          "Tuesday",
          "Wednesday",
          "Thursday",
          "Friday",
          "Saturday"
        ][index];

        if (schedule["Morning"]) availableTime[day]!.add("Morning");
        if (schedule["Afternoon"]) availableTime[day]!.add("Afternoon");
        if (schedule["Evening"]) availableTime[day]!.add("Evening");
      }
    }
    return getAvailableTimeString(availableTime);
  }

  String getAvailableTimeString(Map<String, List<String>> availableTime) {
    final List<String> availableDays = [];
    availableTime.forEach((day, time) {
      if (time.isNotEmpty) {
        availableDays.add("$day ${time.join(",")}");
      }
    });

    return availableDays.isNotEmpty
        ? "Hi Jose You are free on ${availableDays.join(", ")}"
        : "";
  }
}
