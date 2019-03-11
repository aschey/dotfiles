local awful = require("awful")
local gears = require("gears")

local function snap(axis, placement)
    local f = awful.placement.scale
        + placement
        + (axis and awful.placement['maximize_'..axis] or nil)
    local geo = f(client.focus, {honor_workarea=true, to_percent = 0.5})
end

local function run()
    return gears.table.join(
        awful.key({ modkey, }, "f",
            function (c)
                c.fullscreen = not c.fullscreen
                c:raise()
            end,
            {description = "toggle fullscreen", group = "client"}),
        awful.key({ modkey, }, "q", function (c)
            c:kill()
        end,
        {description = "close", group = "client"}),
        awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle,
            {description = "toggle floating", group = "client"}),

        awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
            {description = "move to master", group = "client"}),

        awful.key({ modkey, }, "o", function (c) c:move_to_screen() end,
            {description = "move to screen", group = "client"}),

        awful.key({ modkey, }, "t", function (c) c.ontop = not c.ontop end,
            {description = "toggle keep on top", group = "client"}),

        awful.key({ modkey, }, "n",
            function (c)
                -- The client currently has the input focus, so it cannot be
                -- minimized, since minimized clients can't have the focus.
                c.minimized = true
            end ,
            {description = "minimize", group = "client"}),

        awful.key({ modkey,           }, "m",
            function (c)
                c.maximized = not c.maximized
                c:raise()
            end ,
            {description = "(un)maximize", group = "client"}),

        awful.key({ modkey, "Control" }, "m",
            function (c)
                c.maximized_vertical = not c.maximized_vertical
                c:raise()
            end ,
            {description = "(un)maximize vertically", group = "client"}),

        awful.key({ modkey, "Shift"   }, "m",
            function (c)
                c.maximized_horizontal = not c.maximized_horizontal
                c:raise()
            end ,
            {description = "(un)maximize horizontally", group = "client"}),

        awful.key({ modkey, "Shift"}, "Left",
            function (c)
                snap('vertically', awful.placement.left)
            end ,
            {description = "snap left", group = "client"}),

        awful.key({ modkey, "Shift"}, "Right",
            function (c)
                snap('vertically', awful.placement.right)
            end ,
            {description = "snap right", group = "client"}),

        awful.key({ modkey, "Shift"}, "Up",
            function (c)
                snap('horizontally', awful.placement.top)
            end ,
            {description = "snap up", group = "client"}),
            
        awful.key({ modkey, "Shift"}, "Down",
            function (c)
                snap('horizontally', awful.placement.bottom)
            end ,
            {description = "snap down", group = "client"})
    )
end

return {
    run = run
}
