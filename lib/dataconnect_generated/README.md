# dataconnect_generated SDK

## Installation
```sh
flutter pub get firebase_data_connect
flutterfire configure
```
For more information, see [Flutter for Firebase installation documentation](https://firebase.google.com/docs/data-connect/flutter-sdk#use-core).

## Data Connect instance
Each connector creates a static class, with an instance of the `DataConnect` class that can be used to connect to your Data Connect backend and call operations.

### Connecting to the emulator

```dart
String host = 'localhost'; // or your host name
int port = 9399; // or your port number
ExampleConnector.instance.dataConnect.useDataConnectEmulator(host, port);
```

You can also call queries and mutations by using the connector class.
## Queries

### ListAnalysisReports
#### Required Arguments
```dart
// No required arguments
ExampleConnector.instance.listAnalysisReports().execute();
```



#### Return Type
`execute()` returns a `QueryResult<ListAnalysisReportsData, void>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await ExampleConnector.instance.listAnalysisReports();
ListAnalysisReportsData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
final ref = ExampleConnector.instance.listAnalysisReports().ref();
ref.execute();

ref.subscribe(...);
```


### GetAIModels
#### Required Arguments
```dart
// No required arguments
ExampleConnector.instance.getAiModels().execute();
```



#### Return Type
`execute()` returns a `QueryResult<GetAIModelsData, void>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await ExampleConnector.instance.getAiModels();
GetAIModelsData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
final ref = ExampleConnector.instance.getAiModels().ref();
ref.execute();

ref.subscribe(...);
```

## Mutations

### CreateUser
#### Required Arguments
```dart
// No required arguments
ExampleConnector.instance.createUser().execute();
```



#### Return Type
`execute()` returns a `OperationResult<CreateUserData, void>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await ExampleConnector.instance.createUser();
CreateUserData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
final ref = ExampleConnector.instance.createUser().ref();
ref.execute();
```


### UpdateAnalysisReport
#### Required Arguments
```dart
String id = ...;
double positivePercentage = ...;
double negativePercentage = ...;
double outstandingPercentage = ...;
ExampleConnector.instance.updateAnalysisReport(
  id: id,
  positivePercentage: positivePercentage,
  negativePercentage: negativePercentage,
  outstandingPercentage: outstandingPercentage,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<UpdateAnalysisReportData, UpdateAnalysisReportVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await ExampleConnector.instance.updateAnalysisReport(
  id: id,
  positivePercentage: positivePercentage,
  negativePercentage: negativePercentage,
  outstandingPercentage: outstandingPercentage,
);
UpdateAnalysisReportData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String id = ...;
double positivePercentage = ...;
double negativePercentage = ...;
double outstandingPercentage = ...;

final ref = ExampleConnector.instance.updateAnalysisReport(
  id: id,
  positivePercentage: positivePercentage,
  negativePercentage: negativePercentage,
  outstandingPercentage: outstandingPercentage,
).ref();
ref.execute();
```

