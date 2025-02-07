import 'package:dart_periphery/dart_periphery.dart';
import 'package:flutter/foundation.dart';

class PwmBuzzerPeriodService {
  static PWM pwm0 = PWM(2, 0); //Model 5, Model 4B uses PWM(0,0) or PWM(0,1)
  // static PWM pwm1 = PWM(2, 1);
  // static PWM pwm2 = PWM(2, 2);
  // static PWM pwm3 = PWM(2, 3);

  static bool systemOnOffState = true;
  int setPwmPeriod = 10000000; //10000000ns = 100Hz freq, 1000000ns = 1000 Hz

  void initializePwmBuzzerPeriodService() {
    try {
      // pwm = PWM(0, 1);
      debugPrint('Initial PwmBuzzerPeriodService Info: ${pwm0.getPWMinfo()}');
    } catch (e) {
      debugPrint('Initial PwmBuzzerPeriodService Error: $e');
    }
    try {
      pwm0.setPeriodNs(10000000);
      // pwm1.setPeriodNs(10000000);
      // pwm2.setPeriodNs(10000000);
      // pwm3.setPeriodNs(10000000);
      debugPrint('PwmBuzzerPeriodService period Info: ${pwm0.getPeriodNs()}');
    } catch (e) {
      debugPrint('PwmBuzzerPeriodService period Error: $e');
    }
    try {
      pwm0.setDutyCycleNs(0);
      // pwm1.setDutyCycleNs(0);
      // pwm2.setDutyCycleNs(0);
      // pwm3.setDutyCycleNs(0);
      debugPrint(
        'PwmBuzzerPeriodService Dutycycle Info: ${pwm0.getDutyCycleNs()}',
      );
    } catch (e) {
      debugPrint('PwmBuzzerPeriodService Dutycycle Error: $e');
    }
    try {
      pwm0.enable();
      // pwm1.enable();
      // pwm2.enable();
      // pwm3.enable();
      debugPrint('PwmBuzzerPeriodService Enable Info: ${pwm0.getEnabled()}');
    } catch (e) {
      debugPrint('PwmBuzzerPeriodService Enable Error: $e');
    }
    try {
      pwm0.setPolarity(Polarity.pwmPolarityNormal);
      // pwm1.setPolarity(Polarity.pwmPolarityNormal);
      // pwm2.setPolarity(Polarity.pwmPolarityNormal);
      // pwm3.setPolarity(Polarity.pwmPolarityNormal);
      // debugPrint('PwmBuzzerPeriodService Polarity Info: ${pwm.getPolarity()}');
      // debugPrint('Final PwmBuzzerPeriodService Info: ${pwm.getPWMinfo()}');
    } catch (e) {
      debugPrint('PwmBuzzerPeriodService Polarity Error: $e');
    }
  }

  /*
  Musical Notes and Frequencies
  Note Frequency (Hz) Period (nano seconds)
  C4 261.63           3822192
  D4 293.66           3405299
  E4 329.63           3033704 
  F4 349.23           2863442
  G4 392.00           2551020
  A4 440.00           2272727
  B4 493.88           2024783
  C5 523.25           1911102
  D5 587.33           1702610
  E5 659.25           1515151
  F5 698.46           1435409
  G5 783.99           1273885
  A5 880.00           1136363
  B5 987.77           1015128
  C6 1046.50          956022
  */
  void updatePwmPeriod(int updatePeriod) {
    int c4 = 3822192;
    int d4 = 3405299;
    int e4 = 3033704;
    int f4 = 2863442;
    int g4 = 2551020;
    int a4 = 2272727;
    int b4 = 2024783;
    int c5 = 1911102;
    int d5 = 1702610;
    int e5 = 1515151;
    // int f5 = 1435409;
    // int g5 = 1273885;
    // int a5 = 1136363;
    // int b5 = 1015128;
    // int c6 = 956022;

    if (systemOnOffState) {
      if (updatePeriod == 0) {
        pwm0.setPeriodNs(0);
        pwm0.setDutyCycleNs(0);
      }
      if (updatePeriod == 10) {
        pwm0.setPeriodNs(c4);
        pwm0.setDutyCycleNs((c4 / 2).toInt());
      }
      if (updatePeriod == 20) {
        pwm0.setPeriodNs(d4);
        pwm0.setDutyCycleNs((d4 / 2).toInt());
      }
      if (updatePeriod == 30) {
        pwm0.setPeriodNs(e4);
        pwm0.setDutyCycleNs((e4 / 2).toInt());
      }
      if (updatePeriod == 40) {
        pwm0.setPeriodNs(f4);
        pwm0.setDutyCycleNs((f4 / 2).toInt());
      }
      if (updatePeriod == 50) {
        pwm0.setPeriodNs(g4);
        pwm0.setDutyCycleNs((g4 / 2).toInt());
      }
      if (updatePeriod == 60) {
        pwm0.setPeriodNs(a4);
        pwm0.setDutyCycleNs((a4 / 2).toInt());
      }
      if (updatePeriod == 70) {
        pwm0.setPeriodNs(b4);
        pwm0.setDutyCycleNs((b4 / 2).toInt());
      }
      if (updatePeriod == 80) {
        pwm0.setPeriodNs(c5);
        pwm0.setDutyCycleNs((c5/ 2).toInt());
      }
      if (updatePeriod == 90) {
        pwm0.setPeriodNs(d5);
        pwm0.setDutyCycleNs((d5 / 2).toInt());
      }
      if (updatePeriod == 100) {
        pwm0.setPeriodNs(e5);
        pwm0.setDutyCycleNs((e5 / 2).toInt());
      }
      debugPrint(
        'In PwmBuzzerPeriodService updatePwmPeriod period= ${pwm0.getPeriodNs()}',
      );
      debugPrint(
        'In PwmBuzzerPeriodService updatePwmPeriod PWM Info: ${pwm0.getDutyCycleNs()}',
      );
    }
  }

  void updatePwmDutyCycle(int updateDutyCycle) {
    // debugPrint(
    //     'In PwmBuzzerPeriodService updatePwmDutyCycle systemOnOffSate: $systemOnOffState');
    if (systemOnOffState) {
      pwm0.setDutyCycleNs(updateDutyCycle * 100000);
      debugPrint(
        'In PwmBuzzerPeriodService updatePwmDutyCycle DutyCycleNs= ${pwm0.getDutyCycleNs()}',
      );
      debugPrint(
        'In PwmBuzzerPeriodService updatePwmDutyCycle PWM Info: ${pwm0.getPWMinfo()}',
      );
    }
  }

  void pwmBuzzerPeriodServiceSystemOnOff() {
    systemOnOffState = !systemOnOffState;
    // debugPrint('In PwmBuzzerPeriodService systemOnOffState: $systemOnOffState');
    if (!systemOnOffState) {
      pwm0.disable();
      // pwm1.disable();
      // pwm2.disable();
      // pwm3.disable();
      // debugPrint('In PwmBuzzerPeriodService enable: ${pwm.getEnabled()}');
    }
    if (systemOnOffState) {
      pwm0.enable();
      // pwm1.enable();
      // pwm2.enable();
      // pwm3.enable();
      // debugPrint('In PwmBuzzerPeriodService enable: ${pwm.getEnabled()}');
    }
  }
} // End of class PwmBuzzerPeriodService
