// ignore_for_file: unused_import

import 'package:flutter/foundation.dart';

class DialogRequest {
  final String? title;
  final String? description;
  final String? buttonTitle;
  final String? cancelTitle;

  DialogRequest(
      {this.title, this.description, this.buttonTitle, this.cancelTitle});
}

class DialogResponse {
  final String? fieldOne;
  final String? fieldTwo;
  final bool? confirmed;

  DialogResponse({
    this.fieldOne,
    this.fieldTwo,
    this.confirmed,
  });
}
