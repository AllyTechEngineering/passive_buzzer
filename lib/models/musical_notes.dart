class MusicalNotes {
  // c4 = 3822192;
  // d4 = 3405299;
  // e4 = 3033704;
  // f4 = 2863442;
  // g4 = 2551020;
  // a4 = 2272727;
  // b4 = 2024783;
  // c5 = 1911102;
  // d5 = 1702610;
  // e5 = 1515151;
  // f5 = 1435409;
  // g5 = 1273885;
  // a5 = 1136363;
  // b5 = 1015128;
  // c6 = 956022;
  static const Map<int, int> notePeriods = {
    0: 0, // No sound
    10: 3822192, // C4
    20: 3405299, // D4
    30: 3033704, // E4
    40: 2863442, // F4
    50: 2551020, // G4
    60: 2272727, // A4
    70: 2024783, // B4
    80: 1911102, // C5
    90: 1702610, // D5
    100: 1515151, // E5
  };
  static const Map<int, String> noteNames = {
    0: "Off",
    10: "C4",
    20: "D4",
    30: "E4",
    40: "F4",
    50: "G4",
    60: "A4",
    70: "B4",
    80: "C5",
    90: "D5",
    100: "E5",
  };
}
