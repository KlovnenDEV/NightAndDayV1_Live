- Visit - launcherleaks.com
-------------------------------------------------------
CORE RESOURCES
--------------------------------------------------------

Basic Installation:

* Put core_dispatch in resources folder
* Start the resource in your cfg file

Exports/Triggers:

Template for call:
exports['core_dispach']:addCall(code, title, {
{icon=fontawsomeicon, info=information}
}, {x,y,z}, job, cooldown, blipsprite, blipcolor )

Example for call:

exports['core_dispach']:addCall("20-12", "Vehicle is being stolen", {
{icon="fa-ruler", info="4.5 MILES"},
{icon="fa-car", info="RED LAMBORGHINI"}
}, {31.103099822998,6360.7177734375,30.844619}, "police", 3000, 11, 5 )

Template for message

exports['core_dispach']:addMessage(message, {x,y,z}, job, cooldown, blipsprite, blipcolor )

Example for message

exports['core_dispach']:addMessage("I need medical help", {31.103099822998,6360.7177734375,30.844619}, "ambulance", 3000, 11, 5 )