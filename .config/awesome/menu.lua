local awful = require("awful")
local beautiful = require("beautiful")
local menubar = require("menubar")

local function run()
    -- Create a launcher widget and a main menu
    myawesomemenu = {
        { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
        { "restart", awesome.restart },
        { "quit", function() awesome.quit() end },
    }
    
    mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon }
                                    }
                            })
    
    mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                        menu = mymainmenu })
end

return {
    run = run
}