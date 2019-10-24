module(..., package.seeall)

function test_unitaryVote()
  local result = true
  local fileName = "knn.csv"
  local unknownPoint = {10, -4}
  local distanceMetric = cosineSimilarity
  local distanceMetricName = "cosineSimilarity"
  local dataset = createArray(fileName)
  local k = 5
  local distanceArray = createDistanceArray(unknownPoint, dataset, distanceMetric, pValue)
  local orderedArray = orderDistanceArray(distanceArray, distanceMetricName)
  local kNNArray = kNNeighbourhood(orderedArray, k)
  if calculateClass(kNNArray, unitary) ~= "a" then
    result = nil
  end
  assert_not_nil(result, "unitary voting system incorrect")
end

function test_harmonicVote()
  local result = true
  local fileName = "knn.csv"
  local unknownPoint = {8, 8}
  local distanceMetric = cosineSimilarity
  local distanceMetricName = "cosineSimilarity"
  local dataset = createArray(fileName)
  local k = 5
  local distanceArray = createDistanceArray(unknownPoint, dataset, distanceMetric, pValue)
  local orderedArray = orderDistanceArray(distanceArray, distanceMetricName)
  local kNNArray = kNNeighbourhood(orderedArray, k)
  if calculateClass(kNNArray, harmonic) ~= "b" then
    result = nil
  end
  assert_not_nil(result, "harmonic mean voting system incorrect")
end