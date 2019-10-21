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

function test_arrayHasThreeDimensions()
  local test = createArray(fileName)
  local result = true
  for i=1, #test do
    if #test[i] ~= 3 then
	  result = nil
	end
  end
  assert_not_nil(result, "dataset array has wrong number of dimensions")
end

function test_arrayXValuesAreNumbers()
  local test = createArray(fileName)
  local result = true
  for i=1, #test do
    if tonumber(test[i][1]) == nil then
	  result = nil
	end
  end
  assert_not_nil(result, "x-value not number")
end

function test_arrayYValuesAreNumbers()
  local test = createArray(fileName)
  local result = true
  for i=1, #test do
    if tonumber(test[i][2]) == nil then
	  result = nil
	end
  end
  assert_not_nil(result, "y-value not number")
end

function test_areOnlyTwoTags()
  local test = createArray(fileName)
  local numberOfTags = 1
  for i = 1, (#test - 1) do
    tag1 = test[i][3]
	tag2 = test[i+1][3]
	if tag1 ~= tag2 then
	    numberOfTags = numberOfTags + 1
	end
    print(numberOfTags)
  end
  assert_equal(2, numberOfTags, "wrong number of categories! This program only uses two!")
end