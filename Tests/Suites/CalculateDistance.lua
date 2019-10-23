module(..., package.seeall)

function test_cosineSimilarity()
  --a small function to round numbers to a custom number of places.
  function round(num, pl)
    return math.floor((num*math.pow(10,pl)+0.5))/math.pow(10,pl)
  end
  --test points
   local point1 = {-10, 5}
   local point2 = {3, 6}
   local point3 = {12, 2}
   local point4 = {5, 9}
   local point5 = {1, -4}
   local point6 = {-2, -8}
   local result = true
   --test
  if round(cosineSimilarity(point1,point2), 3) ~= 0.000 or round(cosineSimilarity(point2,point3), 3) ~= 0.588 or round(cosineSimilarity(point3,point4), 3) ~= 0.623 or round(cosineSimilarity(point4,point5), 3) ~= -0.730 or round(cosineSimilarity(point5,point6), 3) ~= 0.882 or round(cosineSimilarity(point1,point6),3) ~= -0.217 then
    result = nil
  end 
  assert_not_nil(result, "cosine similarity calculation failed")
end

function test_euclideanDistance()
  function round(num, pl)
    return math.floor((num*math.pow(10,pl)+0.5))/math.pow(10,pl)
  end
  local point1 = {-10, 5}
  local point2 = {3, 6}
  local point3 = {12, 2}
  local result = true
   --test
  if round(minkowskiDistance(point1, point2, 2), 3) ~= 13.038 or round(minkowskiDistance(point2, point3, 2), 3) ~= 9.849 then    
    result = nil
  end 
  assert_not_nil(result, "euclidean distance calculation failed")
end

function test_manhattanDistance()
  local point1 = {5, 9}
  local point2 = {1, -4}
  local point3 = {-2, -8}
  local result = true
  if minkowskiDistance(point1,point2,1) ~= 17 or minkowskiDistance(point2, point3, 1) ~= 7 or minkowskiDistance(point1, point3, 1) ~= 24 then
    result = nil
  end
  assert_not_nil(result, "manhattan distance calculation failed")
end

function test_chebyshevDistance()
  local point1 = {5, 9}
  local point2 = {1, -4}
  local point3 = {-2, -8}
  local result = true
  if chebyshevDistance(point1,point2) ~= 13 or chebyshevDistance(point2,point3) ~= 4 or chebyshevDistance(point1,point3) ~= 17 then
    result = nil
  end
  assert_not_nil(result, "chebyshev distance calculation failed")
end