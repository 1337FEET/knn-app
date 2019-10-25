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
 
    local sceneGroup = self.view
    local phase = event.phase
    local widget = require( "widget" )
	
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
	    local point = {}
		local graphGroup = display.newGroup()
        local background = display.newRect(display.contentCenterX,display.contentCenterY,_W,_H)
		background:setFillColor(1,1,1)
		sceneGroup:insert(background)
		local unclassifiedPoint = display.newCircle(20 + 28 * mysteryPoint[1], 320 - 28 * mysteryPoint[2], 12)
		unclassifiedPoint:setFillColor(0,1,0,.5)
		sceneGroup:insert(unclassifiedPoint)
		local array = createDynamicArray(mysteryPoint,dataset,metricSelection,p)
		local dynamicGraphArray = kNNeighbourhood(array, k)
		for i = 1, #dynamicGraphArray do
		  point[i] = display.newCircle(20 + 28 * dynamicGraphArray[i][1][1], 320 - 28 * dynamicGraphArray[i][1][2], 12)
		  if dynamicGraphArray[i][1][3] == "a" then
		    point[i]:setFillColor(1,0,0,.5)
		  elseif dynamicGraphArray[i][1][3] == "b" then
		    point[i]:setFillColor(0,0,1, .5)
		  end
	    graphGroup:insert(point[i])
		end
		sceneGroup:insert(graphGroup)
		local columnData = 
        { 
            { 
                align = "left",
                width = 400,
                labelPadding = 20,
                startIndex = 1,
                labels = { "Unitary Voting System", "Harmonic Mean Voting System"}
            }
		}
		local function vote(event)
		    timer.performWithDelay(60, getValue)
		end
		pickerWheel = widget.newPickerWheel(
		{
		    x = 160,
			top = 350,
			columns = columnData,
			style = "resizeable",
			width = 400,
			rowHeight = 32,
			fontSize = 16,
			onValueSelected = vote
		})
		function getValue(event)
            local class = calculateClass(dynamicGraphArray, pickerWheel:getValues()[1].index)
			print(class)
			if class == "a" then unclassifiedPoint:setFillColor(1,0,0,1) else unclassifiedPoint:setFillColor(0,0,1,1) end
			return			
	    end
		sceneGroup:insert(pickerWheel)
		local function buttonPress(event) 
		  voteSelection = pickerWheel:getValues()[1].index
		  --composer.gotoScene("scene")
		end
		local buttonGroup = display.newGroup()
        local buttonImage = display.newRect( buttonGroup, 160, 500, 60, 30)
		buttonImage:setFillColor(.7,.7,.7)
		local buttonText = display.newText
		{
		  parent = buttonGroup,
		  text = "Next", 
		  x = 160,
		  y = 500,
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