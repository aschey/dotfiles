local awful = require("awful")

local function run()
    autorunApps =
    {
        "/home/aschey/.cache/wal/.fehbg",
        "compton --backend glx"
    }
    for app = 1, #autorunApps do
        awful.util.spawn(autorunApps[app])
    end
end

return {
    run = run
}