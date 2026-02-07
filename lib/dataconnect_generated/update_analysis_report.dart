part of 'generated.dart';

class UpdateAnalysisReportVariablesBuilder {
  String id;
  double positivePercentage;
  double negativePercentage;
  double outstandingPercentage;

  final FirebaseDataConnect _dataConnect;
  UpdateAnalysisReportVariablesBuilder(this._dataConnect, {required  this.id,required  this.positivePercentage,required  this.negativePercentage,required  this.outstandingPercentage,});
  Deserializer<UpdateAnalysisReportData> dataDeserializer = (dynamic json)  => UpdateAnalysisReportData.fromJson(jsonDecode(json));
  Serializer<UpdateAnalysisReportVariables> varsSerializer = (UpdateAnalysisReportVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<UpdateAnalysisReportData, UpdateAnalysisReportVariables>> execute() {
    return ref().execute();
  }

  MutationRef<UpdateAnalysisReportData, UpdateAnalysisReportVariables> ref() {
    UpdateAnalysisReportVariables vars= UpdateAnalysisReportVariables(id: id,positivePercentage: positivePercentage,negativePercentage: negativePercentage,outstandingPercentage: outstandingPercentage,);
    return _dataConnect.mutation("UpdateAnalysisReport", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class UpdateAnalysisReportAnalysisReportUpdate {
  final String id;
  UpdateAnalysisReportAnalysisReportUpdate.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdateAnalysisReportAnalysisReportUpdate otherTyped = other as UpdateAnalysisReportAnalysisReportUpdate;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  UpdateAnalysisReportAnalysisReportUpdate({
    required this.id,
  });
}

@immutable
class UpdateAnalysisReportData {
  final UpdateAnalysisReportAnalysisReportUpdate? analysisReport_update;
  UpdateAnalysisReportData.fromJson(dynamic json):
  
  analysisReport_update = json['analysisReport_update'] == null ? null : UpdateAnalysisReportAnalysisReportUpdate.fromJson(json['analysisReport_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdateAnalysisReportData otherTyped = other as UpdateAnalysisReportData;
    return analysisReport_update == otherTyped.analysisReport_update;
    
  }
  @override
  int get hashCode => analysisReport_update.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (analysisReport_update != null) {
      json['analysisReport_update'] = analysisReport_update!.toJson();
    }
    return json;
  }

  UpdateAnalysisReportData({
    this.analysisReport_update,
  });
}

@immutable
class UpdateAnalysisReportVariables {
  final String id;
  final double positivePercentage;
  final double negativePercentage;
  final double outstandingPercentage;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  UpdateAnalysisReportVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<String>(json['id']),
  positivePercentage = nativeFromJson<double>(json['positivePercentage']),
  negativePercentage = nativeFromJson<double>(json['negativePercentage']),
  outstandingPercentage = nativeFromJson<double>(json['outstandingPercentage']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdateAnalysisReportVariables otherTyped = other as UpdateAnalysisReportVariables;
    return id == otherTyped.id && 
    positivePercentage == otherTyped.positivePercentage && 
    negativePercentage == otherTyped.negativePercentage && 
    outstandingPercentage == otherTyped.outstandingPercentage;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, positivePercentage.hashCode, negativePercentage.hashCode, outstandingPercentage.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['positivePercentage'] = nativeToJson<double>(positivePercentage);
    json['negativePercentage'] = nativeToJson<double>(negativePercentage);
    json['outstandingPercentage'] = nativeToJson<double>(outstandingPercentage);
    return json;
  }

  UpdateAnalysisReportVariables({
    required this.id,
    required this.positivePercentage,
    required this.negativePercentage,
    required this.outstandingPercentage,
  });
}

