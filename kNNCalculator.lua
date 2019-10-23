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
	for i = 1, #orderedArray do
	  print(orderedArray[i][2])
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
	for i = 1, #orderedArray do
      print(orderedArray[i][2])
	end
  end
  return orderedArray
end