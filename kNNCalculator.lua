function createDistanceArray(unknownPoint, dataset, distanceMetric, pValue)
  local distanceArray = {}
  for i = 1, #dataset do
   distanceArray[i] = {dataset[i],calculateDistance(distanceMetric, unknownPoint, dataset[i], pValue)}
  end
  return distanceArray
end