part of 'gmana_ext.dart';

extension ShowSnackBar on BuildContext {
  void showErrorSnackBar({required String message}) {
    showSnackBar(
      message: message,
      backgroundColor: Colors.red,
      color: Colors.white,
    );
  }

  void showSnackBar({
    required String message,
    Color color = Colors.grey,
    Color backgroundColor = Colors.white,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: color),
        ),
        backgroundColor: backgroundColor,
      ),
    );
  }
}
