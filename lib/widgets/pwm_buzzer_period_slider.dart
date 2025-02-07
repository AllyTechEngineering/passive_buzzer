import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passive_buzzer/bloc/pwm_buzzer_period_cubit/pwm_buzzer_period_cubit.dart';
import 'package:passive_buzzer/widgets/rectangular_slider_thumb_shape.dart';

class PwmBuzzerPeriodSlider extends StatelessWidget {
  final bool vertical;

  const PwmBuzzerPeriodSlider({super.key, this.vertical = false});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PwmBuzzerPeriodCubit, PwmBuzzerPeriodState>(
      builder: (context, state) {
        return SizedBox(
          height: 300, // Ensures full height is used
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Period: ${state.pwmPeriod}%',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Expanded(
                // Allows the slider to expand fully
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 6, // Thicker track
                    // thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
                    thumbShape: const RectangularSliderThumbShape(),
                    overlayShape: const RoundSliderOverlayShape(
                      overlayRadius: 16,
                    ),
                    tickMarkShape: const RoundSliderTickMarkShape(),
                    activeTickMarkColor: Colors.white,
                    inactiveTickMarkColor: Colors.black,
                    showValueIndicator: ShowValueIndicator.always,
                    valueIndicatorColor: Colors.blueGrey,
                    inactiveTrackColor: Colors.grey,
                    activeTrackColor: Colors.blueGrey,
                    thumbColor: Colors.deepOrangeAccent,
                    valueIndicatorTextStyle: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  child: RotatedBox(
                    quarterTurns: vertical ? 3 : 0, // Rotate slider vertically
                    child: Slider(
                      value: state.pwmPeriod.toDouble(),
                      min: 0,
                      max: 100,
                      divisions: 10, // Add tick marks (10 steps)
                      label: '${state.pwmPeriod}Hz', // Display percentage
                      onChanged: (value) {
                        context.read<PwmBuzzerPeriodCubit>().updatePwmPeriod(
                          value.toInt(),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
