function cosineSimilarity(point1, point2)
  function vectorMagnitude(pnt)
    return math.sqrt(math.pow(pnt[1],2) + math.pow(pnt[2],2))
  end
  
  function dotProduct (pnt1, pnt2)
    return pnt1[1]*pnt2[1] + pnt1[2]*pnt2[2]
  end

  distance = dotProduct(point1, point2)/(vectorMagnitude(point1)*vectorMagnitude(point2))
  
  return distance
end