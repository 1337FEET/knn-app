function cosineSimilarity(point1, point2)
  function vectorMagnitude(pnt)
    return math.sqrt(math.pow(pnt[1],2) + math.pow(pnt[2],2))
  end
  
  function dotProduct (pnt1, pnt2)
    return pnt1[1]*pnt2[1] + pnt1[2]*pnt2[2]
  end

  local distance = dotProduct(point1, point2)/(vectorMagnitude(point1)*vectorMagnitude(point2))
  return distance
end
--p value = 1 for manhattan distance. p = 2 for euclidean etc.
function minkowskiDistance(point1, point2, p)
  local distance = math.pow(math.pow(math.abs(point1[1] - point2[1]), p) +  math.pow(math.abs(point1[2] - point2[2]), p), 1/p)
  return distance
end
--Even though chebyshev distance is a special case of minkowski distance, finding infinite limits in lua appears to be quite complicated, therefore I have made a different function.
function chebyshevDistance(point1, point2)
  local distance = math.max(math.abs(point1[1]-point2[1]),point1[2]-point2[2])
  return distance
end
--p for minkowski
function calculateDistance(metric, point1, point2, p)
  if metric == minkowskiDistance then
    return metric(point1,point2, p)
  end
  if metric == manhattanDistance then
    metric = minkowskiDistance
    return metric(point1,point2, 1)
  end
  if metric == euclideanDistance then
    metric = minkowskiDistance
    return metric(point1,point2, 2)
  else return metric(point1, point2) end
end