import 'package:dart_periphery/dart_periphery.dart';
import 'package:flutter/foundation.dart';
import 'package:passive_buzzer/models/musical_notes.dart';

class PwmBuzzerPeriodService {
  static PWM pwm0 = PWM(2, 0); //Model 5, Model 4B uses PWM(0,0) or PWM(0,1)
  static PWM pwm1 = PWM(2, 1);
  static int songDutyCycle = 0;
  static int index = 1;
  // static PWM pwm2 = PWM(2, 2);
  // static PWM pwm3 = PWM(2, 3);

  static bool systemOnOffState = true;
  static bool musicalSongState = true;

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
      pwm1.setPeriodNs(10000000);
      // pwm2.setPeriodNs(10000000);
      // pwm3.setPeriodNs(10000000);
      debugPrint('PwmBuzzerPeriodService period Info: ${pwm0.getPeriodNs()}');
    } catch (e) {
      debugPrint('PwmBuzzerPeriodService period Error: $e');
    }
    try {
      pwm0.setDutyCycleNs(0);
      pwm1.setDutyCycleNs(0);
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
      pwm1.enable();
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
  Note Frequency (Hz) Period (nano milliseconds)
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
  void updatePwmPeriod(int updatePeriod) async {
    if (systemOnOffState) {
      // Get the period from the lookup table, default to the last known period if not found
      int period = MusicalNotes.notePeriods[updatePeriod] ?? pwm0.getPeriodNs();

      if (updatePeriod == 0) {
        // Stop sound: Set duty cycle to 0, but do NOT change period
        pwm0.setDutyCycleNs(0);
      } else {
        int dutyCycle = (period / 2).toInt(); // Default to 50% duty cycle

        // Ensure duty cycle is always less than period
        // if (dutyCycle >= period) {
        //   dutyCycle = (period * 0.4).toInt(); // Reduce to 40% if needed
        // }

        pwm0.setPeriodNs(period);
        pwm0.setDutyCycleNs(dutyCycle);
      }

      debugPrint('Updated PWM Period: ${pwm0.getPeriodNs()} ns');
      debugPrint('Updated PWM Duty Cycle: ${pwm0.getDutyCycleNs()} ns');
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

  void updateMusicalSongState() async {
    musicalSongState = !musicalSongState;

    // Define two songs: Each is a sequence of three notes
    List<int> song1 = [10, 30, 50, 10, 30, 50]; // (C4, E4, G4)
    List<int> song2 = [50, 30, 10, 50, 30, 10]; // (G4, E4, C4)

    // Pick which song to play based on toggle state
    List<int> selectedSong = musicalSongState ? song1 : song2;

    debugPrint("Playing ${musicalSongState ? 'Song 1' : 'Song 2'}");

    for (int note in selectedSong) {
      int period = MusicalNotes.notePeriods[note] ?? pwm0.getPeriodNs();
      int dutyCycle = (period / 2).toInt();

      // Set PWM for the current note
      pwm0.setPeriodNs(period);
      pwm0.setDutyCycleNs(dutyCycle);

      debugPrint(
        "Playing Note: ${MusicalNotes.noteNames[note]} (Period: $period ns)",
      );

      // Wait for 1 second before playing the next note
      await Future.delayed(const Duration(milliseconds: 100));
    }

    // Turn off the buzzer after song is complete
    pwm0.setDutyCycleNs(0);
    debugPrint("Song finished, buzzer off.");
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
