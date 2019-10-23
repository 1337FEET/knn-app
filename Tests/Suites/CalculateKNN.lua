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