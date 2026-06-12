const { validateAdminArgs } = require('firebase-admin/data-connect');

const connectorConfig = {
  connector: 'example',
  serviceId: 'soufeedbackapp',
  location: 'us-east4'
};
exports.connectorConfig = connectorConfig;

function createUser(dcOrOptions, options) {
  const { dc: dcInstance, options: inputOpts} = validateAdminArgs(connectorConfig, dcOrOptions, options, undefined);
  dcInstance.useGen(true);
  return dcInstance.executeMutation('CreateUser', undefined, inputOpts);
}
exports.createUser = createUser;

function listAnalysisReports(dcOrOptions, options) {
  const { dc: dcInstance, options: inputOpts} = validateAdminArgs(connectorConfig, dcOrOptions, options, undefined);
  dcInstance.useGen(true);
  return dcInstance.executeQuery('ListAnalysisReports', undefined, inputOpts);
}
exports.listAnalysisReports = listAnalysisReports;

function updateAnalysisReport(dcOrVarsOrOptions, varsOrOptions, options) {
  const { dc: dcInstance, vars: inputVars, options: inputOpts} = validateAdminArgs(connectorConfig, dcOrVarsOrOptions, varsOrOptions, options, true, true);
  dcInstance.useGen(true);
  return dcInstance.executeMutation('UpdateAnalysisReport', inputVars, inputOpts);
}
exports.updateAnalysisReport = updateAnalysisReport;

function getAiModels(dcOrOptions, options) {
  const { dc: dcInstance, options: inputOpts} = validateAdminArgs(connectorConfig, dcOrOptions, options, undefined);
  dcInstance.useGen(true);
  return dcInstance.executeQuery('GetAIModels', undefined, inputOpts);
}
exports.getAiModels = getAiModels;

