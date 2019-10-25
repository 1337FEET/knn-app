function filePath(path)
  if path == nil then
    local filePath = system.pathForFile([[Data/knn.csv]])
    if filePath == nil then
      return nil
    else return filePath end
  end
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
  local i = 1
  while data do
   local line = data:read("*line")
   if line == nil then break end
   local x, y, tag = string.match(line,"(%d*),(%d*),(%a*)")
   dataset[i] = {x, y, tag}
   i = i + 1
  end
  data:close()
  return dataset
end