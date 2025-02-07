import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:passive_buzzer/services/pwm_buzzer_period_service.dart';

part 'pwm_buzzer_on_off_state.dart';

class PwmBuzzerOnOffCubit extends Cubit<PwmBuzzerOnOffState> {
  final PwmBuzzerPeriodService pwmBuzzerPeriodService;

  PwmBuzzerOnOffCubit(this.pwmBuzzerPeriodService)
    : super(const PwmBuzzerOnOffState());

  void toggleMotorPower() {
    pwmBuzzerPeriodService.pwmBuzzerPeriodServiceSystemOnOff();
    emit(state.copyWith(isOn: !state.isOn));
  }
}
