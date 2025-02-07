part of 'pwm_buzzer_on_off_cubit.dart';

class PwmBuzzerOnOffState extends Equatable {
  final bool isOn;

  const PwmBuzzerOnOffState({this.isOn = true});

  PwmBuzzerOnOffState copyWith({bool? isOn}) {
    return PwmBuzzerOnOffState(
      isOn: isOn ?? this.isOn,
    );
  }

  @override
  List<Object> get props => [isOn];

  @override
  String toString() => 'PwmBuzzerOnOffState(isOn: $isOn)';
}