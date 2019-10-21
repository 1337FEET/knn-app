-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

require "Tests.lunatest"
require "dataLoader"

--Test suites
lunatest.suite("Tests.Suites.LoadData")

--Main function (to be moved)
fileName = "knn.csv"

--Run tests
lunatest.run()

