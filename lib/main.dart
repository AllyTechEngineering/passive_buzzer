import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passive_buzzer/bloc/pwm_buzzer_on_off_cubit/pwm_buzzer_on_off_cubit.dart';
import 'package:passive_buzzer/bloc/pwm_buzzer_period_cubit/pwm_buzzer_period_cubit.dart';
import 'package:passive_buzzer/screens/home_screen.dart';
import 'package:passive_buzzer/services/pwm_buzzer_period_service.dart';

void main() {
  final pwmBuzzerPeriodService = PwmBuzzerPeriodService();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<PwmBuzzerPeriodCubit>(
      create: (context) => PwmBuzzerPeriodCubit(pwmBuzzerPeriodService),
    ),
    BlocProvider<PwmBuzzerOnOffCubit>(
      create: (context) => PwmBuzzerOnOffCubit(pwmBuzzerPeriodService),
    ),
  ], child:  MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Passive Buzzer Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomeScreen(),
    );
  }
}