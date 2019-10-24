function calculateClass(array, votingSystem)
  return votingSystem(array)
end

function unitary(array)
  tag1 = array[1][1][3]
  tag1Number = 1
  tag2Number = 0
  for i = 2, #array do
    if array[i][1][3] == tag1 then
	  tag1Number = tag1Number + 1
	else
	  tag2 = array[i][1][3]
	  if tag2 ~= nil then
	    tag2Number = tag2Number +1
	  end
	end
  end 
  if tag1Number < tag2Number then
    return tag2
  end
  if tag1Number > tag2Number then
    return tag1
  end
end

function harmonic(array)
  tag1 = array[1][1][3]
  tag1Number = 1
  tag2Number = 0
  for i = 2, #array do
    if array[i][1][3] == tag1 then
	--If distances are equal, the amount they add to the voting should be equal. This is the point from the if-statement below.
	  if array[i][2] == array[i-1][2] then
	    tag1Number = tag1Number + (1/(i-1))
	  else tag1Number = tag1Number + (1/(i)) end
	else
	  tag2 = array[i][1][3]
	  if tag2 ~= nil then
	    if array[i][2] == array[i-1][2] then
	      tag2Number = tag2Number + (1/(i-1))
	    else tag2Number = tag2Number + (1/(i)) end
	  end
	end
  end
  if tag1Number < tag2Number then
    return tag2
  end
  if tag1Number > tag2Number then
    return tag1
  end
end