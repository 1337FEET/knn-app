function filePath(fileName)
  local filePath = system.pathForFile([[Data\]] .. fileName)
   if filePath == nil then
    return nil
   else return filePath end
end

function loadData(fileName)
  local path = filePath(fileName)
  if path == nil then return nil end
  local data = io.open(path, "r")
  return data
end

function createArray(fileName)
  local data = loadData(fileName)
  local dataset = {{}}
  return dataset
end