module(..., package.seeall)
--Is array created and is it the same size?
function test_distanceArray()
  local fileName = "knn.csv"
  local unknownPoint = {{1,2},{4,5},{-1,-10},{13,20}}
  local distanceMetric = {manhattanDistance, euclideanDistance, minkowskiDistance, cosineSimilarity}
  local pValue = {1,2,3,4,5,6,7}
  local dataset = createArray(fileName)
  local distanceArray
  local result = nil
  for i = 1, #unknownPoint do
    for j = 1, #distanceMetric do
	  for k = 1, #pValue do
	    distanceArray = createDistanceArray(unknownPoint[i], dataset, distanceMetric[j], pValue[k])
	    if #dataset == #distanceArray and dataset ~= nil and distanceArray ~= nil then
		  result = true
		end
      end
	end
  end
  assert_not_nil(result, "Inconsistency between size of distance array and size of dataset")
end

function test_orderDistanceArray()
  local result = true
  local fileName = "knn.csv"
  local unknownPoint = {4,5}
  local distanceMetric = {manhattanDistance, cosineSimilarity}
  local dataset = createArray(fileName)
  for i = 1, #distanceMetric do
    local distanceArray = createDistanceArray(unknownPoint, dataset, distanceMetric[i], pValue)
    local testArray = orderDistanceArray(distanceArray, distanceMetric[i])
    for j = 1, #testArray - 1 do
      if testArray[j] > testArray[j+1] then
	    result = nil
	  end
    end
  end
  assert_not_nil(result, "distance array not ordered correctly")
end