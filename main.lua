-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

require "Tests.lunatest"
require "dataLoader"
require "distanceCalculator"

--Test suites
lunatest.suite("Tests.Suites.LoadData")
lunatest.suite("Tests.Suites.CalculateDistance")

--Main function (to be moved)
fileName = "knn.csv"

--Run tests
lunatest.run()

