# Data Connect data flow

This diagram shows how the four files pair up and what each bulk-insert mutation
loads. The two paths are separate: the feedback export is not part of the seed
data mutation.

Files represented: [firestore_export.json](./firestore_export.json),
[firestore_export.gql](./firestore_export.gql),
[seed_data_parsed.json](./seed_data_parsed.json), and
[seed_data.gql](./seed_data.gql).

```mermaid
flowchart LR
  subgraph feedbackFiles["Firestore feedback export"]
    feedbackJson["firestore_export.json<br/>Feedback records"]
    feedbackGql["firestore_export.gql<br/>ExportFirestoreData<br/>Feedback_insertMany"]
    feedbackJson -. "same records as mutation payload" .-> feedbackGql
  end

  feedbackGql -->|"bulk insert"| feedbackTable[("Data Connect<br/>Feedback")]

  subgraph seedFiles["Seed data"]
    seedJson["seed_data_parsed.json<br/>Rows for five entities"]
    seedGql["seed_data.gql<br/>CreateSeedData<br/>transactional mutation"]
    seedJson -. "same seed records as mutation payload" .-> seedGql
  end

  seedGql -->|"bulk insert"| userTable[("User")]
  seedGql -->|"bulk insert"| modelTable[("AIModel")]
  seedGql -->|"bulk insert"| reportTable[("AnalysisReport")]
  seedGql -->|"bulk insert"| textTable[("AnalyzedText")]
  seedGql -->|"bulk insert"| sentimentTable[("TextSegmentSentiment")]

  userTable -->|"userId"| reportTable
  reportTable -->|"analysisReportId"| textTable
  reportTable -->|"analysisReportId"| sentimentTable
  textTable -->|"analyzedTextId"| sentimentTable

  classDef file fill:#eef5ff,stroke:#3973ac,color:#17324d
  classDef operation fill:#fff4dc,stroke:#bd7b00,color:#503400
  classDef entity fill:#e8f5e9,stroke:#388e3c,color:#183d1b

  class feedbackJson,seedJson file
  class feedbackGql,seedGql operation
  class feedbackTable,userTable,modelTable,reportTable,textTable,sentimentTable entity
```

The dashed arrows indicate that each JSON file contains the records represented
by its corresponding GraphQL mutation. The solid arrows show inserts and the
ID references present in the seed payloads.
