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
  for i = 1, #kNNArray do
    print(kNNArray[i][1][3])
  end
  if calculateClass(kNNArray, unitary) ~= "a" then
    result = nil
  end
  assert_not_nil(result, "unitary voting system incorrect")
end