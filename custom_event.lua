local eve = event:getHeader("Event-Calling-Function")
local eve1 = event:serialize("json")
local size = event:getHeader("Conference-Size")
if ( eve == "conference_member_add") then
	freeswitch.consoleLog("info", eve1.. "\n" )	
	freeswitch.consoleLog("info", eve.. "\n" )
	api = freeswitch.API();
	post_response = api:execute("curl", "http://electric-snow-3852.herokuapp.com/testplivo/conference/join/ post  ".. eve)
	freeswitch.consoleLog("info", post_response.. "\n")
	if(size=="1") then
	local session1 =freeswitch.Session("user/testplivo2",session)
	session1:execute("conference","$1@default")
	end
elseif (eve == "conference_member_del")then
	freeswitch.consoleLog("info", eve.. "\n" )
	 api = freeswitch.API();
        post_response = api:execute("curl", "http://electric-snow-3852.herokuapp.com/testplivo/conference/exit/ post ".. eve)
        freeswitch.consoleLog("info", post_response.. "\n")
else
end
