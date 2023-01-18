import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weekly_scheduler/bloc/sheduler_bloc.dart';
import 'package:weekly_scheduler/screen/scheduler_screen.dart';
import 'package:weekly_scheduler/widgets/button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Weekly Sheduler'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BlocBuilder<ShedulerBloc, ShedulerState>(
                  builder: (context, state) {
                    return Text(
                      state.summary,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    );
                  },
                ),
                CustomButton(
                  onPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ShedulerScreen(),
                        ));
                  },
                  buttonText: 'Add Shedules',
                )
              ],
            ),
          ),
        ));
  }
}
