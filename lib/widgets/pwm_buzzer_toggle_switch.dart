import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passive_buzzer/bloc/pwm_buzzer_on_off_cubit/pwm_buzzer_on_off_cubit.dart';


class PwmBuzzerToggleSwitch extends StatelessWidget {
  const PwmBuzzerToggleSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PwmBuzzerOnOffCubit, PwmBuzzerOnOffState>(
      builder: (context, state) {
        return Container(
          width: 200.0,
          height: 150.0,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: state.isOn ? Colors.green : Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                state.isOn ? 'ON Song' : 'OFF Song',
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              Switch(
                value: state.isOn,
                onChanged: (value) {
                  context.read<PwmBuzzerOnOffCubit>().toggleMusicalSongState();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}