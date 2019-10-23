-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

require "Tests.lunatest"
require "dataLoader"
require "distanceCalculator"
require "kNNCalculator"
require "votingSystems"
--Test suites
lunatest.suite("Tests.Suites.LoadData")
lunatest.suite("Tests.Suites.CalculateDistance")
lunatest.suite("Tests.Suites.CalculateKNN")
lunatest.suite("Tests.Suites.Voting")

--Main function (to be moved)
local fileName = "knn.csv"
local unknownPoint = {4,3}
local k = 2

--distanceMetric can equal minkowskiDistance, euclideanDistance, cosineSimilarity, manhattanDistance.
local distanceMetric = {manhattanDistance, euclideanDistance, minkowskiDistance, cosineSimilarity}
local pValue = 2 --for minkowski, value is not used except in minkowski, must be 1 or greater.
local votingSystem = "unitary"

local dataset = createArray(fileName)
local distanceArray = createDistanceArray(unknownPoint, dataset, distanceMetric[3], pValue)

--Run tests
lunatest.run()