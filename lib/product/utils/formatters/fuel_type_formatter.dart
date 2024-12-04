final class CarFormatter {
  static String fuelTypeFormat(int fueltype) {
    switch (fueltype) {
      case 1:
        return 'Dizel';
      case 2:
        return 'Benzin';
      case 3:
        return 'Elektrik';
    }
    return '';
  }

  static String gearTypeFormat(int gearType) {
    switch (gearType) {
      case 1:
        return 'Manuel';
      case 2:
        return 'Otomatik';
    }
    return '';
  }
}
