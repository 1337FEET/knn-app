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
        local background = display.newRect(display.contentCenterX,display.contentCenterY,_W,_H)
		background:setFillColor(1,1,1)
		sceneGroup:insert(background)
		sceneGroup:insert(graph)
		--picker wheel for distance metrics with text field for minkowski p value
		local columnData = 
        { 
            { 
                align = "left",
                width = 200,
                labelPadding = 20,
                startIndex = 2,
                labels = { "Manhattan Distance", "Euclidean Distance", "Minkowski Distance", "Cosine Similarity" }
            }
		}
	    --p value slider
		local pValueGroup = display.newGroup()
			local pValueDisplay = display.newText(
		{
		    parent = pValueGroup,
			text = "50",
			x = 296,
			y = 400,
			font = native.systemFont,
			fontSize = 13
		})
		pValueDisplay:setFillColor(0,0,0)
		local function adjustPValue(event)
		    --don't want a p value of zero
		    pValueDisplay.text = math.ceil(event.value/100 * 99 +1)
		end
		local pValueSlider = widget.newSlider(
		{
		    height = 90,
			orientation = "vertical",
			x = 260,
			y = 410,
			listener = adjustPValue
		})
		local lblPValue = display.newText(
		{
		    parent = pValueGroup,
			text = "P-value",
			x = 260,
			y = 340,
			font = native.systemFont,
			fontSize = 14
		})
		lblPValue:setTextColor(0,0,0)
		pValueGroup:insert(pValueSlider)
		sceneGroup:insert(pValueGroup)
		pValueGroup.isVisible = false
		--needed to add delay, as touch events are recorded too quickly, and that meant declaring variables before initialising so that the order would be useful to the program
		local pickerWheel
		local values
		local function checkForP(event)
		    timer.performWithDelay(60, getValue)
		end
		pickerWheel = widget.newPickerWheel(
		{
		    x = 160,
			top = 330,
			columns = columnData,
			style = "resizeable",
			width = 200,
			rowHeight = 20,
			fontSize = 14,
			onValueSelected = checkForP
		})
        function getValue(event)
	        values = pickerWheel:getValues() 
            if values[1].index == 3 then
			    pValueGroup.isVisible = true
		    else pValueGroup.isVisible = false end
			return			
	    end
		sceneGroup:insert(pickerWheel)
		local function buttonPress(event) 
		  metricSelection = pickerWheel:getValues()[1].index
		  p = tonumber(pValueDisplay.text)
		  composer.gotoScene("scene3")
		end
		local buttonGroup = display.newGroup()
        local buttonImage = display.newRect( buttonGroup, 250, 450, 60, 30)
		buttonImage:setFillColor(.7,.7,.7)
		local buttonText = display.newText
		{
		  parent = buttonGroup,
		  text = "Next", 
		  x = 250,
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
		local function buttonPressBack(event) 
		  buttonGroup:removeEventListener("touch", buttonPress)
		  composer.gotoScene("scene1") 
		end
		local buttonGroup2 = display.newGroup()
        local buttonImage2 = display.newRect( buttonGroup2, 90, 450, 60, 30)
		buttonImage2:setFillColor(.7,.7,.7)
		local buttonText2 = display.newText
		{
		  parent = buttonGroup2,
		  text = "Back", 
		  x = 90,
		  y = 450,
		  font = native.systemFont,
		  fontSize = 14
		}
		buttonText2:setTextColor(1,1,1)
		buttonGroup2:addEventListener("touch", buttonPressBack)
		sceneGroup:insert(buttonGroup2)
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