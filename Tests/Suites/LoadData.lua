module(..., package.seeall)

function suite_setup()

end

function setup()

end

function teardown()

end

function test_dataFileExists()
  print("DEBUG")
  print(data)
  assert_not_nil(data, "data file not found")
end

function test_dataLoaderReturnsNonNil()
  assert_not_nil(loadData("knn.csv"), "problem with data loader")
end