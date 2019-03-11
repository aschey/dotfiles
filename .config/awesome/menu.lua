local awful = require("awful")
local beautiful = require("beautiful")
local menubar = require("menubar")

local function run()
    -- Create a launcher widget and a main menu
    myawesomemenu = {
        { "restart", awesome.restart },
        { "quit", function() awesome.quit() end },
    }
    
    mymainmenu = awful.menu({ items = { 
            { "awesome", myawesomemenu, beautiful.awesome_icon }
        }   
    })
    
    mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                        menu = mymainmenu })
end

return {
    run = run
}