part of 'generated.dart';

class ListAnalysisReportsVariablesBuilder {
  
  final FirebaseDataConnect _dataConnect;
  ListAnalysisReportsVariablesBuilder(this._dataConnect, );
  Deserializer<ListAnalysisReportsData> dataDeserializer = (dynamic json)  => ListAnalysisReportsData.fromJson(jsonDecode(json));
  
  Future<QueryResult<ListAnalysisReportsData, void>> execute() {
    return ref().execute();
  }

  QueryRef<ListAnalysisReportsData, void> ref() {
    
    return _dataConnect.query("ListAnalysisReports", dataDeserializer, emptySerializer, null);
  }
}

@immutable
class ListAnalysisReportsAnalysisReports {
  final String id;
  final String reportName;
  final double positivePercentage;
  final double negativePercentage;
  final double outstandingPercentage;
  final Timestamp createdAt;
  final ListAnalysisReportsAnalysisReportsUser user;
  ListAnalysisReportsAnalysisReports.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']),
  reportName = nativeFromJson<String>(json['reportName']),
  positivePercentage = nativeFromJson<double>(json['positivePercentage']),
  negativePercentage = nativeFromJson<double>(json['negativePercentage']),
  outstandingPercentage = nativeFromJson<double>(json['outstandingPercentage']),
  createdAt = Timestamp.fromJson(json['createdAt']),
  user = ListAnalysisReportsAnalysisReportsUser.fromJson(json['user']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListAnalysisReportsAnalysisReports otherTyped = other as ListAnalysisReportsAnalysisReports;
    return id == otherTyped.id && 
    reportName == otherTyped.reportName && 
    positivePercentage == otherTyped.positivePercentage && 
    negativePercentage == otherTyped.negativePercentage && 
    outstandingPercentage == otherTyped.outstandingPercentage && 
    createdAt == otherTyped.createdAt && 
    user == otherTyped.user;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, reportName.hashCode, positivePercentage.hashCode, negativePercentage.hashCode, outstandingPercentage.hashCode, createdAt.hashCode, user.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['reportName'] = nativeToJson<String>(reportName);
    json['positivePercentage'] = nativeToJson<double>(positivePercentage);
    json['negativePercentage'] = nativeToJson<double>(negativePercentage);
    json['outstandingPercentage'] = nativeToJson<double>(outstandingPercentage);
    json['createdAt'] = createdAt.toJson();
    json['user'] = user.toJson();
    return json;
  }

  ListAnalysisReportsAnalysisReports({
    required this.id,
    required this.reportName,
    required this.positivePercentage,
    required this.negativePercentage,
    required this.outstandingPercentage,
    required this.createdAt,
    required this.user,
  });
}

@immutable
class ListAnalysisReportsAnalysisReportsUser {
  final String id;
  final String displayName;
  ListAnalysisReportsAnalysisReportsUser.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']),
  displayName = nativeFromJson<String>(json['displayName']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListAnalysisReportsAnalysisReportsUser otherTyped = other as ListAnalysisReportsAnalysisReportsUser;
    return id == otherTyped.id && 
    displayName == otherTyped.displayName;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, displayName.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['displayName'] = nativeToJson<String>(displayName);
    return json;
  }

  ListAnalysisReportsAnalysisReportsUser({
    required this.id,
    required this.displayName,
  });
}

@immutable
class ListAnalysisReportsData {
  final List<ListAnalysisReportsAnalysisReports> analysisReports;
  ListAnalysisReportsData.fromJson(dynamic json):
  
  analysisReports = (json['analysisReports'] as List<dynamic>)
        .map((e) => ListAnalysisReportsAnalysisReports.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListAnalysisReportsData otherTyped = other as ListAnalysisReportsData;
    return analysisReports == otherTyped.analysisReports;
    
  }
  @override
  int get hashCode => analysisReports.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['analysisReports'] = analysisReports.map((e) => e.toJson()).toList();
    return json;
  }

  ListAnalysisReportsData({
    required this.analysisReports,
  });
}

