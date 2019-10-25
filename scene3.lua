local composer = require( "composer" )
 
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 
 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
 
end
 
 
-- show()
function scene:show( event )
    local point = {}
    local sceneGroup = self.view
    local phase = event.phase
    local widget = require( "widget" )
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
		k = 1
        local unclassifiedPoint = display.newCircle(20 + 28 * mysteryPoint[1], 320 - 28 * mysteryPoint[2], 12)
		unclassifiedPoint:setFillColor(0,1,0,.5)
		local dynamicGraphGroup = display.newGroup()
		local background = display.newRect(display.contentCenterX,display.contentCenterY,_W,_H)
		background:setFillColor(1,1,1)
	    sceneGroup:insert(background)
		--creates array ordered by distance
		local array = createDynamicArray(mysteryPoint,dataset,metricSelection,p)
		local dynamicGraphArray = kNNeighbourhood(array, 1)
		for i = 1, #dynamicGraphArray do
		  point[i] = display.newCircle(20 + 28 * dynamicGraphArray[i][1][1], 320 - 28 * dynamicGraphArray[i][1][2], 12)
		  if dynamicGraphArray[i][1][3] == "a" then
		    point[i]:setFillColor(1,0,0,.5)
		  elseif dynamicGraphArray[i][1][3] == "b" then
		    point[i]:setFillColor(0,0,1, .5)
		  end
	    dynamicGraphGroup:insert(point[i])
		end
		sceneGroup:insert(unclassifiedPoint)
		--slider for k values - 0 < k <= #array and k % 2 ~= 0
		local sliderGroup = display.newGroup()
		local kValue = display.newText(
		{
		    parent = sliderGroup,
			text = "1",
			x = 160,
			y = 410
		})
		kValue:setTextColor(0,0,0)
		local lblKValue = display.newText(
		{
		    parent = sliderGroup,
			text = "K value (before equidistance tie-breakers)",
			x = 160,
			y = 350
		})
		lblKValue:setTextColor(0,0,0)
		local function kSliderListener( event )
		  for i = 1, #point do
		      display.remove(point[i])
	      end
		  display.remove(dynamicGraphGroup)
		  --limit max of range to #array
		  local currentValue = math.ceil((event.value*#array)/100)
		  --eliminate even numbers
		  if currentValue % 2 == 0 then
		  --ensure odd number k while limiting k to less than #array
		    if currentValue == #array then
		      k = currentValue - 1
			else k = currentValue + 1 end
		  else k = currentValue end
		  kValue.text = k
		  local dynamicGraphArray = kNNeighbourhood(array, k)
	      if tostring(type(dynamicGraphArray)) == "string" then
		      kValue.text = dynamicGraphArray
		  else
		      local dynamicGraphGroup = display.newGroup()
		      for i = 1, #dynamicGraphArray do
		          point[i] = display.newCircle(20 + 28 * dynamicGraphArray[i][1][1], 320 - 28 * dynamicGraphArray[i][1][2], 12)
		          if dynamicGraphArray[i][1][3] == "a" then
		             point[i]:setFillColor(1,0,0,.5)
		          elseif dynamicGraphArray[i][1][3] == "b" then
		             point[i]:setFillColor(0,0,1, .5)
		          end
		      dynamicGraphGroup:insert(point[i])
		      end
	      end
		end
        local kSlider = widget.newSlider
		{
		  x = 160,
		  y = 380,
		  value = 0,
		  listener = kSliderListener
		}
		sliderGroup:insert(kSlider)
		sceneGroup:insert(sliderGroup)
		local function buttonPress(event) 
		  for i = 1, #point do
		    display.remove(point[i])
	      end
		    display.remove(dynamicGraphGroup)
			point = nil
			dynamicGraphGroup = nil
		  composer.gotoScene("scene4")
		end
		local buttonGroup = display.newGroup()
        local buttonImage = display.newRect( buttonGroup, 160, 450, 60, 30)
		buttonImage:setFillColor(.7,.7,.7)
		local buttonText = display.newText
		{
		  parent = buttonGroup,
		  text = "Next", 
		  x = 160,
		  y = 450,
		  font = native.systemFont,
		  fontSize = 14
		}
		buttonText:setTextColor(1,1,1)
		local function delayButton(event)
		    buttonGroup:addEventListener("touch", buttonPress)
		    sceneGroup:insert(buttonGroup)
	    end
		timer.performWithDelay(245, delayButton)
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
 
    end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
 
    end
end
 
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
 
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
 
return scene