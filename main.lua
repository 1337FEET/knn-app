-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

--require "Tests.lunatest"

require "dataLoader"
require "distanceCalculator"
require "kNNCalculator"
require "votingSystems"
--Test suites
--lunatest.suite("Tests.Suites.LoadData")
--lunatest.suite("Tests.Suites.CalculateDistance")
--lunatest.suite("Tests.Suites.CalculateKNN")
--lunatest.suite("Tests.Suites.Voting")

--global variables
_W = display.viewableContentWidth
_H = display.viewableContentHeight

--Main function (to be moved)
-- local fileName = "knn.csv"
-- local unknownPoint = {4,3}
dataset = createArray()
mysteryPoint = {}
metricSelection = nil
p = nil
voteSelection = nil
k = nil
-- local k = 23
-- local distanceMetric = {manhattanDistance, euclideanDistance, minkowskiDistance, cosineSimilarity}
-- local distanceMetricName = {"manhattanDistance", "euclideanDistance", "minkowskiDistance", "cosineSimilarity"}
-- local distanceMetricSelection = 3 --1 = manhattan, 2 = euclidean, etc.
-- local pValue = 2 --for minkowski, value is not used except in minkowski, must be 1 or greater.
-- local votingSystem = {unitary, harmonic} --unitary of harmonic voting system
-- local votingSystemSelection = 2--1 for unitary, 2 for harmonic

-- local dataset = createArray()
-- local distanceArray = createDistanceArray(unknownPoint, dataset, distanceMetric[distanceMetricSelection], pValue)
-- local orderedArray = orderDistanceArray(distanceArray, distanceMetricName[distanceMetricSelection])
-- local kNNeighbourhoodArray = kNNeighbourhood(orderedArray, k)
-- if tostring(type(kNNeighbourhoodArray)) == "string" then
  -- print(kNNeighbourhoodArray)
-- else 
  -- local class = calculateClass(kNNeighbourhoodArray, votingSystem[votingSystemSelection])
-- end


--Run tests
--lunatest.run()

local composer = require("composer")

display.setStatusBar(display.HiddenStatusBar)

composer.gotoScene("scene1")