module(..., package.seeall)

function suite_setup()

end

function setup()

end

function teardown()

end

function test_dataFileExists()
  assert_not_nil(data, "loading data file failed")
end