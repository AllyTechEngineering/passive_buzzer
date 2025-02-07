part of 'pwm_buzzer_period_cubit.dart';

class PwmBuzzerPeriodState extends Equatable {
  final int pwmPeriod;

  const PwmBuzzerPeriodState({this.pwmPeriod = 0});

  PwmBuzzerPeriodState copyWith({int? pwmPeriod}) {
    return PwmBuzzerPeriodState(
      pwmPeriod: pwmPeriod ?? this.pwmPeriod,
    );
  }

  @override
  List<Object> get props => [pwmPeriod];

  @override
  String toString() => 'PwmBuzzerPeriodState(pwmPeriod: $pwmPeriod)';
}