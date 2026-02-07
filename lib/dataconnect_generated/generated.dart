library dataconnect_generated;
import 'package:firebase_data_connect/firebase_data_connect.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';

part 'create_user.dart';

part 'list_analysis_reports.dart';

part 'update_analysis_report.dart';

part 'get_ai_models.dart';







class ExampleConnector {
  
  
  CreateUserVariablesBuilder createUser () {
    return CreateUserVariablesBuilder(dataConnect, );
  }
  
  
  ListAnalysisReportsVariablesBuilder listAnalysisReports () {
    return ListAnalysisReportsVariablesBuilder(dataConnect, );
  }
  
  
  UpdateAnalysisReportVariablesBuilder updateAnalysisReport ({required String id, required double positivePercentage, required double negativePercentage, required double outstandingPercentage, }) {
    return UpdateAnalysisReportVariablesBuilder(dataConnect, id: id,positivePercentage: positivePercentage,negativePercentage: negativePercentage,outstandingPercentage: outstandingPercentage,);
  }
  
  
  GetAiModelsVariablesBuilder getAiModels () {
    return GetAiModelsVariablesBuilder(dataConnect, );
  }
  

  static ConnectorConfig connectorConfig = ConnectorConfig(
    'us-east4',
    'example',
    'soufeedbackapp',
  );

  ExampleConnector({required this.dataConnect});
  static ExampleConnector get instance {
    return ExampleConnector(
        dataConnect: FirebaseDataConnect.instanceFor(
            connectorConfig: connectorConfig,
            sdkType: CallerSDKType.generated));
  }

  FirebaseDataConnect dataConnect;
}
