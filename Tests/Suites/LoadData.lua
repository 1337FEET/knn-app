module(..., package.seeall)

function suite_setup()

end

function setup()

end

function teardown()

end

function test_dataFileExists()
  local test = filePath(fileName)
  assert_not_nil(test, "data file not found")
end

function test_dataLoaderReturnsNonNil()
  local test = loadData(fileName)
  assert_not_nil(test, "problem with data loader")
end

function test_arrayCreationSuccessful()
  local test = createArray(fileName)
  assert_not_nil(test, "dataset array not created")
end