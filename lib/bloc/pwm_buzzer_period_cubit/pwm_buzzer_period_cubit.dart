import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:passive_buzzer/services/pwm_buzzer_period_service.dart';


part 'pwm_buzzer_period_state.dart';

class PwmBuzzerPeriodCubit extends Cubit<PwmBuzzerPeriodState> {
  final PwmBuzzerPeriodService pwmBuzzerPeriodService;

  PwmBuzzerPeriodCubit(this.pwmBuzzerPeriodService) : super(const PwmBuzzerPeriodState()){
    pwmBuzzerPeriodService.initializePwmBuzzerPeriodService();
  }
  
  void updatePwmPeriod(int newPwmPeriod) {
    emit(state.copyWith(pwmPeriod: newPwmPeriod));
    pwmBuzzerPeriodService.updatePwmPeriod(newPwmPeriod);
  }
}