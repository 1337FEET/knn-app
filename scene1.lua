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
		--event listeners only activate when sliders are moved, therefore I have added a default value in case they don't move the sliders
		mysteryPoint = {5,5}
        local background = display.newRect(display.contentCenterX,display.contentCenterY,_W,_H)
		background:setFillColor(1,1,1)
		sceneGroup:insert(background)
		local point = {}
		--plot dataset to a 280 x 280 square which is a displaygroup
		graph = display.newGroup()
		for i = 1, #dataset do
		  point[i] = display.newCircle(20 + 28 * dataset[i][1], 320 - 28 * dataset[i][2], 12)
		  if dataset[i][3] == "a" then
		    point[i]:setFillColor(1,0,0,.5)
		  elseif dataset[i][3] == "b" then
		    point[i]:setFillColor(0,0,1, .5)
		  end
		  graph:insert(point[i])
		end
		sceneGroup:insert(graph)
		local unknownPoint = display.newCircle(160, 180, 12)
		unknownPoint:setFillColor(0,1,0,.5)
		sceneGroup:insert(unknownPoint)
		
		--set x position of unknown point
		local xGroup = display.newGroup()
		local lblX = display.newText(
		{
		  parent = xGroup,
		  text = "x-value of unknown",
		  x = 160,
		  y = 340,
		  font = native.systemFont,
		  fontSize = 16
		})
		lblX:setTextColor(0,0,0)
		local xValue = display.newText(
		{
		  parent = xGroup,
		  text = "5",
		  x = 30,
		  y = 365,
		  font = native.systemFont,
		  fontSize = 16
		})
		xValue:setTextColor(0,0,0)
		local function unknownXSliderListener( event )
		  unknownPoint.x = 20 + 28 * math.ceil(event.value/10)
		  xValue.text = math.ceil(event.value/10)
		  mysteryPoint[1] = math.ceil(event.value/10)
		end
		  
        local unknownXSlider = widget.newSlider
		{
		  x = 160,
		  y = 365,
		  listener = unknownXSliderListener
		}
		xGroup:insert(unknownXSlider)
		sceneGroup:insert(xGroup)
		--set y position of unknown point
		local yGroup = display.newGroup()
		local lblY = display.newText(
		{
		  parent = yGroup,
		  text = "y-value of unknown",
		  x = 160,
		  y = 395,
		  font = native.systemFont,
		  fontSize = 16
		})
		lblY:setTextColor(0,0,0)
		local yValue = display.newText(
		{
		  parent = yGroup,
		  text = "5",
		  x = 30,
		  y = 420,
		  font = native.systemFont,
		  fontSize = 16
		})
		yValue:setTextColor(0,0,0)
		local function unknownYSliderListener( event )
		  unknownPoint.y = 320 - 28 * math.ceil(event.value/10)
		  yValue.text = math.ceil(event.value/10)
		  mysteryPoint[2] = math.ceil(event.value/10)
		end
		  
        local unknownYSlider = widget.newSlider
		{
		  x = 160,
		  y = 420,
		  listener = unknownYSliderListener
		}
		yGroup:insert(unknownYSlider)
		sceneGroup:insert(yGroup)
		sceneGroup:insert(unknownYSlider)
		local function buttonPress(event) 
		  graph:insert(unknownPoint)
		  composer.gotoScene("scene2")
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
		buttonGroup:addEventListener("touch", buttonPress)
		sceneGroup:insert(buttonGroup)
		
		local function buttonPressBack(event) 
		  --composer.gotoScene("mainMenu") 
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