part of 'generated.dart';

class GetAiModelsVariablesBuilder {
  
  final FirebaseDataConnect _dataConnect;
  GetAiModelsVariablesBuilder(this._dataConnect, );
  Deserializer<GetAiModelsData> dataDeserializer = (dynamic json)  => GetAiModelsData.fromJson(jsonDecode(json));
  
  Future<QueryResult<GetAiModelsData, void>> execute() {
    return ref().execute();
  }

  QueryRef<GetAiModelsData, void> ref() {
    
    return _dataConnect.query("GetAIModels", dataDeserializer, emptySerializer, null);
  }
}

@immutable
class GetAiModelsAIModels {
  final String id;
  final String modelName;
  final String version;
  final String? description;
  final bool? isActive;
  final Timestamp createdAt;
  GetAiModelsAIModels.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']),
  modelName = nativeFromJson<String>(json['modelName']),
  version = nativeFromJson<String>(json['version']),
  description = json['description'] == null ? null : nativeFromJson<String>(json['description']),
  isActive = json['isActive'] == null ? null : nativeFromJson<bool>(json['isActive']),
  createdAt = Timestamp.fromJson(json['createdAt']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetAiModelsAIModels otherTyped = other as GetAiModelsAIModels;
    return id == otherTyped.id && 
    modelName == otherTyped.modelName && 
    version == otherTyped.version && 
    description == otherTyped.description && 
    isActive == otherTyped.isActive && 
    createdAt == otherTyped.createdAt;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, modelName.hashCode, version.hashCode, description.hashCode, isActive.hashCode, createdAt.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['modelName'] = nativeToJson<String>(modelName);
    json['version'] = nativeToJson<String>(version);
    if (description != null) {
      json['description'] = nativeToJson<String?>(description);
    }
    if (isActive != null) {
      json['isActive'] = nativeToJson<bool?>(isActive);
    }
    json['createdAt'] = createdAt.toJson();
    return json;
  }

  GetAiModelsAIModels({
    required this.id,
    required this.modelName,
    required this.version,
    this.description,
    this.isActive,
    required this.createdAt,
  });
}

@immutable
class GetAiModelsData {
  final List<GetAiModelsAIModels> aIModels;
  GetAiModelsData.fromJson(dynamic json):
  
  aIModels = (json['aIModels'] as List<dynamic>)
        .map((e) => GetAiModelsAIModels.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetAiModelsData otherTyped = other as GetAiModelsData;
    return aIModels == otherTyped.aIModels;
    
  }
  @override
  int get hashCode => aIModels.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['aIModels'] = aIModels.map((e) => e.toJson()).toList();
    return json;
  }

  GetAiModelsData({
    required this.aIModels,
  });
}

