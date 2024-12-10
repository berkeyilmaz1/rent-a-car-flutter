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

  static int fuelTypeFromString(String fuelType) {
    switch (fuelType) {
      case 'Dizel':
        return 1;
      case 'Benzin':
        return 2;
      case 'Elektrik':
        return 3;
    }
    return 0;
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

  static int gearTypeFromString(String fuelType) {
    switch (fuelType) {
      case 'Manuel':
        return 1;
      case 'Otomatik':
        return 2;
    }
    return 0;
  }

  static String paymentMethodFormat(int paymentMethod) {
    switch (paymentMethod) {
      case 1:
        return 'Kredi Kartı';
      case 2:
        return 'Nakit';
    }
    return '';
  }

  static String paymentStatusFormat(int paymentStatus) {
    switch (paymentStatus) {
      case 1:
        return 'Başarısız';
      case 2:
        return 'Başarılı';
    }
    return '';
  }
}
