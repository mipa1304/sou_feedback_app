import { ConnectorConfig, DataConnect, OperationOptions, ExecuteOperationResponse } from 'firebase-admin/data-connect';

export const connectorConfig: ConnectorConfig;

export type TimestampString = string;
export type UUIDString = string;
export type Int64String = string;
export type DateString = string;


export interface AIModel_Key {
  id: UUIDString;
  __typename?: 'AIModel_Key';
}

export interface AnalysisReport_Key {
  id: UUIDString;
  __typename?: 'AnalysisReport_Key';
}

export interface AnalyzedText_Key {
  id: UUIDString;
  __typename?: 'AnalyzedText_Key';
}

export interface CreateUserData {
  user_insert: User_Key;
}

export interface GetAiModelsData {
  aIModels: ({
    id: UUIDString;
    modelName: string;
    version: string;
    description?: string | null;
    isActive?: boolean | null;
    createdAt: TimestampString;
  } & AIModel_Key)[];
}

export interface ListAnalysisReportsData {
  analysisReports: ({
    id: UUIDString;
    reportName: string;
    positivePercentage: number;
    negativePercentage: number;
    outstandingPercentage: number;
    createdAt: TimestampString;
    user: {
      id: UUIDString;
      displayName: string;
    } & User_Key;
  } & AnalysisReport_Key)[];
}

export interface TextSegmentSentiment_Key {
  id: UUIDString;
  __typename?: 'TextSegmentSentiment_Key';
}

export interface UpdateAnalysisReportData {
  analysisReport_update?: AnalysisReport_Key | null;
}

export interface UpdateAnalysisReportVariables {
  id: UUIDString;
  positivePercentage: number;
  negativePercentage: number;
  outstandingPercentage: number;
}

export interface User_Key {
  id: UUIDString;
  __typename?: 'User_Key';
}

/** Generated Node Admin SDK operation action function for the 'CreateUser' Mutation. Allow users to execute without passing in DataConnect. */
export function createUser(dc: DataConnect, options?: OperationOptions): Promise<ExecuteOperationResponse<CreateUserData>>;
/** Generated Node Admin SDK operation action function for the 'CreateUser' Mutation. Allow users to pass in custom DataConnect instances. */
export function createUser(options?: OperationOptions): Promise<ExecuteOperationResponse<CreateUserData>>;

/** Generated Node Admin SDK operation action function for the 'ListAnalysisReports' Query. Allow users to execute without passing in DataConnect. */
export function listAnalysisReports(dc: DataConnect, options?: OperationOptions): Promise<ExecuteOperationResponse<ListAnalysisReportsData>>;
/** Generated Node Admin SDK operation action function for the 'ListAnalysisReports' Query. Allow users to pass in custom DataConnect instances. */
export function listAnalysisReports(options?: OperationOptions): Promise<ExecuteOperationResponse<ListAnalysisReportsData>>;

/** Generated Node Admin SDK operation action function for the 'UpdateAnalysisReport' Mutation. Allow users to execute without passing in DataConnect. */
export function updateAnalysisReport(dc: DataConnect, vars: UpdateAnalysisReportVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<UpdateAnalysisReportData>>;
/** Generated Node Admin SDK operation action function for the 'UpdateAnalysisReport' Mutation. Allow users to pass in custom DataConnect instances. */
export function updateAnalysisReport(vars: UpdateAnalysisReportVariables, options?: OperationOptions): Promise<ExecuteOperationResponse<UpdateAnalysisReportData>>;

/** Generated Node Admin SDK operation action function for the 'GetAiModels' Query. Allow users to execute without passing in DataConnect. */
export function getAiModels(dc: DataConnect, options?: OperationOptions): Promise<ExecuteOperationResponse<GetAiModelsData>>;
/** Generated Node Admin SDK operation action function for the 'GetAiModels' Query. Allow users to pass in custom DataConnect instances. */
export function getAiModels(options?: OperationOptions): Promise<ExecuteOperationResponse<GetAiModelsData>>;

