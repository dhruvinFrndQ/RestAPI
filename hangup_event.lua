local eve = event:serialize("json")
freeswitch.consoleLog("info", eve.. "\n" )
api = freeswitch.API();
post_response = api:execute("curl", "http://electric-snow-3852.herokuapp.com/testplivo/hangup/ post ".. eve)
freeswitch.consoleLog("info", post_response.. "\n")
