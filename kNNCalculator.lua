

function createDistanceArray(unknownPoint, dataset, distanceMetric, pValue)
  local distanceArray = {}
  for i = 1, #dataset do
   distanceArray[i] = {dataset[i],calculateDistance(distanceMetric, unknownPoint, dataset[i], pValue)}
  end
  return distanceArray
end

function orderDistanceArray(distanceArray, metric)
  local orderedArray = {} 
  local j = 1
  if tostring(metric) == "cosineSimilarity" then
    while #distanceArray > 0 do
	  j = 1
      for i = 1, #distanceArray do
        if distanceArray[j][2] < distanceArray[i][2] then
          j = i
        end
      end
	  table.insert(orderedArray, distanceArray[j])
	  table.remove(distanceArray, j)
	end
  else
    while #distanceArray > 0 do
	  j = 1
      for i = 1, #distanceArray do
        if distanceArray[j][2] > distanceArray[i][2] then
          j = i
        end
      end
	  table.insert(orderedArray, distanceArray[j])
	  table.remove(distanceArray, j)
    end
  end
  return orderedArray
end

function createDynamicArray(point, dataset, metricSel, pVal)
  local distanceMetric = {manhattanDistance, euclideanDistance, minkowskiDistance, cosineSimilarity}
  local distanceMetricName = {"manhattanDistance", "euclideanDistance", "minkowskiDistance", "cosineSimilarity"}
  local distanceArray = createDistanceArray(point, dataset, distanceMetric[metricSel], pVal)
  local orderedArray = orderDistanceArray(distanceArray, distanceMetricName[metricSel])
  return orderedArray
end

function kNNeighbourhood(array, k)
  if k > #array then
    return "k is greater than dataset size"
  end
  if k <= 0 then
    return "k must be greater than or equal to one"
  end
  if k % 2 == 0 then
    return "k must be odd"
  end
  local kNNeighbourhoodArray = {}
  for i = 1, #array do
    kNNeighbourhoodArray[i] = array[i]
  end
  --tie breaker. k is increased to include all identical distances at the edge of the neighbourhood. k+2 to take into account the non-admissability of even k values
  --if the last two are equidistance and the total dataset would be included if they all were included and the dataset is even in number, then simply remove all of that distance
  while kNNeighbourhoodArray[k][2] == kNNeighbourhoodArray[k+1][2] and kNNeighbourhoodArray[k+1][2] ~= kNNeighbourhoodArray[#array][2] do
    k = k+2
  end
  if kNNeighbourhoodArray[k][2] == kNNeighbourhoodArray[k+1][2] and kNNeighbourhoodArray[k+1][2] == kNNeighbourhoodArray[#array][2] then
    while kNNeighbourhoodArray[k][2] == kNNeighbourhoodArray[k+1][2] and k > 0 do
	  k = k - 1
	end
  end
  if k == 1 and kNNeighbourhoodArray[k][2] == kNNeighbourhoodArray[k+1][2] then
    return "equidistance from all groups, cannot make accurate predictions"
  end
  for i = k+1, #array do
    table.remove(kNNeighbourhoodArray, k+1)
  end
  return kNNeighbourhoodArray
end