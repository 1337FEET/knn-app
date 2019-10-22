module(..., package.seeall)

--This test suite is concerned with the correct measure of distances.
--Therefore the suite setup will contain a number of preselected values,
--which will have known distances from each other that will be used for testing.
function suite_setup()
  local point1 = {-10, 5}
  local point2 = {3, 6}
  local point3 = {12, 2}
  local point4 = {5, 9}
  local point5 = {1, -4}
  local point6 = {-2, -8}
  local result = true
end

function test_cosineSimilarity()
  if cosineSimilarity(point1,point2) ~= 0.000 or cosineSimilarity(point2,point3) ~= 0.588 or cosineSimilarity(point3,point4) ~= 0.623 or cosineSimilarity(point4,point5) ~= -0.730 or cosineSimilarity(point5,point6) ~= 0.882 or cosineSimilarity(point1,point6) ~= -0.217 then
    result = nil
  end 
  assert_not_nil(result, "cosine similarity calculation failed")
end