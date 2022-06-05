### Manual
- Download the script and put it in the `[qb]` directory.
- Add the following code to your server.cfg/resouces.cfg

# If you want to use qb-clothing
only change line 200 this:

local model = v[1]

to this:
local model = tonumber(v[1])
