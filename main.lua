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
data = loadData("knn.csv")
print(data)

--Run tests
lunatest.run()

