import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weekly_scheduler/bloc/sheduler_bloc.dart';
import 'package:weekly_scheduler/const/days.dart';
import 'package:weekly_scheduler/widgets/button.dart';
import 'package:weekly_scheduler/widgets/day_tile.dart';

class ShedulerScreen extends StatelessWidget {
  const ShedulerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set Your Weekly Hours'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<ShedulerBloc, ShedulerState>(
              builder: (context, state) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: 7,
                    itemBuilder: (context, index) => Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: DayTile(
                            index: index,
                            day: days[index],
                          ),
                        ),
                        const Divider()
                      ],
                    ),
                  ),
                );
              },
            ),
            BlocBuilder<ShedulerBloc, ShedulerState>(
              builder: (context, state) {
                return CustomButton(
                  onPress: () {
                    BlocProvider.of<ShedulerBloc>(context)
                        .add(Interpretation(shedules: state.shedules));
                    Navigator.pop(context);
                  },
                  buttonText: 'Save',
                );
              },
            ),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
