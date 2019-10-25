local distanceMetric = {manhattanDistance, euclideanDistance, minkowskiDistance, cosineSimilarity}
local distanceMetricName = {"manhattanDistance", "euclideanDistance", "minkowskiDistance", "cosineSimilarity"}

function createDynamicArray(point, dataset, metricSel, pVal)
  local distanceArray = createDistanceArray(unknownPoint, dataset, distanceMetric[metricSel], pVal)
  local orderedArray = orderDistanceArray(distanceArray, distanceMetricName[metricSel])
  return dynamicArray
end