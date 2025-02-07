import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passive_buzzer/bloc/pwm_buzzer_period_cubit/pwm_buzzer_period_cubit.dart';
import 'package:passive_buzzer/services/pwm_buzzer_period_service.dart';
import 'package:passive_buzzer/widgets/pwm_buzzer_period_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PwmBuzzerPeriodCubit(PwmBuzzerPeriodService()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('PWM Motor Control'),
          centerTitle: true,
        ),
        body: Center(
          child: SizedBox(
            width: 600, // Keep UI centered and constrained
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Vertical PWM Speed Slider (Left Side) with increased height
                SizedBox(
                  width: 100.0, // Keep slider narrow
                  height: 300.0, // Match the combined switch height
                  child: const PwmBuzzerPeriodSlider(vertical: true),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}