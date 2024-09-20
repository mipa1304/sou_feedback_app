// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:SOUFEEDBACKAPP/src/models/dialog_model.dart';

class DialogService {
  final GlobalKey<NavigatorState> _dialogNavigationKey =
      GlobalKey<NavigatorState>();
  late Function(DialogRequest) _showDialogListener;
  late Completer<DialogResponse> _dialogCompleter;
  late Function _showLanguagePickerListener;
  late Function(Widget) _showCustomDialogListener;
  GlobalKey<NavigatorState> get dialogNavigationKey => _dialogNavigationKey;

  /// Registers a callback function. Typically to show the dialog
  void registerDialogListener(Function(DialogRequest) showDialogListener) {
    _showDialogListener = showDialogListener;
  }

  void registerLanguagePickerListener(Function showLanguagePickerListener) {
    _showLanguagePickerListener = showLanguagePickerListener;
  }

  void registerCustomDialogListener(Function(Widget) showCustomDialogListener) {
    _showCustomDialogListener = showCustomDialogListener;
  }

  Widget showLanguagePicker() {
    return _showLanguagePickerListener();
  }

  /// Calls the dialog listener and returns a Future that will wait for dialogComplete.
  Future<DialogResponse> showDialog({
    String? title,
    String? description,
    String? buttonTitle = 'Ok',
  }) {
    _dialogCompleter = Completer<DialogResponse>();
    _showDialogListener(DialogRequest(
      title: title,
      description: description,
      buttonTitle: buttonTitle,
    ));
    return _dialogCompleter.future;
  }

  /// Shows a confirmation dialog
  Future<DialogResponse> showConfirmationDialog(
      {String? title,
      String? description,
      String confirmationTitle = 'Ok',
      String cancelTitle = 'Cancel'}) {
    _dialogCompleter = Completer<DialogResponse>();
    _showDialogListener(DialogRequest(
        title: title,
        description: description,
        buttonTitle: confirmationTitle,
        cancelTitle: cancelTitle));
    return _dialogCompleter.future;
  }

  Future showCustomDialog(Widget widget) {
    _dialogCompleter = Completer<DialogResponse>();
    _showCustomDialogListener(widget);
    return _dialogCompleter.future;
  }

  /// Completes the _dialogCompleter to resume the Future's execution call
  void dialogComplete(DialogResponse response) {
    _dialogNavigationKey.currentState!.pop();
    _dialogCompleter.complete(response);
    // _dialogCompleter = null;
  }

  void changeLanguageComplete(bool result) {
    // _dialogNavigationKey.currentState.pop();
  }
}
