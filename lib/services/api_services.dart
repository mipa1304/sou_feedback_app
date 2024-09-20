/*-----------------file containing methods for calling http requests */

import 'package:flutter/foundation.dart';
import 'package:SOUFEEDBACKAPP/services/api_response.dart';
import 'package:SOUFEEDBACKAPP/services/base_api.dart';

class ApiService extends BaseApi {
  // Login ViewModel

  Future<ApiResponse> getArticlesMethod({required String endpoint}) async {
    ApiResponse response;
    try {
      response = await getRequest(endpoint: endpoint);
      if (kDebugMode) {
        print('no error');
      }
    } catch (e) {
      response = ApiResponse(error: true, errorMessage: e.toString());
    }
    return response;
  }
}
