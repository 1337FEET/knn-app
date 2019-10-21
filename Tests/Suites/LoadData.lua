module(..., package.seeall)

function suite_setup()

end

function setup()

end

function teardown()

end

function test_dataFileExists()
  assert_not_nil(filePath(fileName), "data file not found")
end

function test_dataLoaderReturnsNonNil()
  assert_not_nil(loadData(fileName), "problem with data loader")
end