
function loadData(fileName)
  local filePath = system.pathForFile([[Data\]] .. fileName)
  if filePath == nil then
    return nil
  end
  local data = io.open(filePath, "r")
  return data
end