import 'package:fluttertoast/fluttertoast.dart';

class Toasts {
  static void showErrorFieldToast() {
    Fluttertoast.showToast(
      msg: 'One or more fields is empty',
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static void showEmptyErrorFieldToast() {
    Fluttertoast.showToast(
      msg: 'Unable to proceed. Empty dataset detected.',
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static void showPainterGuideToast() {
    Fluttertoast.showToast(
      msg: 'Paint on the screen the part where you feel pain',
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static void showTakenScheduleToast() {
    Fluttertoast.showToast(
      msg: 'Schedule is already taken',
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static void showDeletedMedicalData() {
    Fluttertoast.showToast(
      msg: 'Medical history data successfully deleted',
      toastLength: Toast.LENGTH_LONG,
    );
  }
}
