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
  local unknownPoint = {10,-4}
  local distanceMetric = {manhattanDistance, cosineSimilarity}
  --No one-to-one relationship between names and functions so had to store names as strings seperately
  local distanceMetricName = {"manhattanDistance", "cosineSimilarity"}
  local dataset = createArray(fileName)
  for i = 1, #distanceMetric do
    local distanceArray = createDistanceArray(unknownPoint, dataset, distanceMetric[i], pValue)
	local testArray = orderDistanceArray(distanceArray, distanceMetricName[i])
    for j = 1, #testArray - 1 do
	  if tostring(distanceMetricName[i]) == "cosineSimilarity" then
        if testArray[j][2] < testArray[j+1][2] then
	      result = nil
		end
	  else 
	    if testArray[j][2] > testArray[j+1][2] then
	     result = nil
	    end
	  end
	end
  end
  assert_not_nil(result, "distance array not ordered correctly")
end

function test_kTooBigWarning()
  local result = true
  local filename = "knn.csv"
  local unknownPoint = {10, -4}
  local distanceMetric = manhattanDistance
  local distanceMetricName = "manhattanDistance"
  local dataset = createArray(filename)
  local k = #dataset + 1
  local distanceArray = createDistanceArray(unknownPoint, dataset, distanceMetric, pValue)
  local orderedArray = orderDistanceArray(distanceArray, distanceMetricName)
  assert_error(pcall(kNNeighbourhood(orderedArray, k)), "Expected k too big error, got nothing")
--if testArray ~= "k is greater than dataset size" then
	--result = nil
  --end
 -- assert_not_nil(result, "No warning on k being bigger than dataset")
end

function test_kZeroOrLess()
  local result = true
  local filename = "knn.csv"
  local unknownPoint = {10, -4}
  local distanceMetric = manhattanDistance
  local distanceMetricName = "manhattanDistance"
  local dataset = createArray(filename)
  local k = {0, -10}
  local distanceArray = createDistanceArray(unknownPoint, dataset, distanceMetric, pValue)
  local orderedArray = orderDistanceArray(distanceArray, distanceMetricName)
  local testArray
  for i = 1, #k do
    testArray = kNNeighbourhood(orderedArray, k[i])
    if testArray ~= "k must be greater than or equal to one" then
	result = nil
	end
  end
  assert_not_nil(result, "No warning on k being less than or equal to zero")
end

function test_kEven()
  local result = true
  local filename = "knn.csv"
  local unknownPoint = {10, -4}
  local distanceMetric = manhattanDistance
  local distanceMetricName = "manhattanDistance"
  local dataset = createArray(filename)
  local k = {2, 6}
  local distanceArray = createDistanceArray(unknownPoint, dataset, distanceMetric, pValue)
  local orderedArray = orderDistanceArray(distanceArray, distanceMetricName)
  local testArray
  for i = 1, #k do
    testArray = kNNeighbourhood(orderedArray, k[i])
    if testArray ~= "k must be odd" then
	result = nil
	end
  end
  assert_not_nil(result, "No warning on k being even")
end

function test_kSize()
  local result = true
  local fileName = "knn.csv"
  local unknownPoint = {10, -4}
  local distanceMetric = manhattanDistance
  local distanceMetricName = "manhattanDistance"
  local dataset = createArray(fileName)
  local k = {3, 5, 15}
  local distanceArray = createDistanceArray(unknownPoint, dataset, distanceMetric, pValue)
  local orderedArray = orderDistanceArray(distanceArray, distanceMetricName)
  local testArray
  for i = 1, #k do
    testArray = kNNeighbourhood(orderedArray, k[i])
	--tie breaker. +2 to take into account the non-admissability of even k values
	while orderedArray[k[i]][2] == orderedArray[k[i]+1][2] do
	  k[i] = k[i] + 2
	end
    if #testArray ~= k[i] then
	  result = nil
	end
  end
  assert_not_nil(result, "size of kNNeighbourhood does not equal k.")
end