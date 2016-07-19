api = freeswitch.API()
method = env:getHeader("Request-Method")
http_uri = env:getHeader("HTTP-Request-URI")
http_query = env:getHeader("HTTP-QUERY")
accept = env:getHeader("Content-Type")
param = env:getHeader("destination") 
param1 = env:getHeader("service")
freeswitch.consoleLog("info", method.. " method \n")
freeswitch.consoleLog("info", http_uri.. " http_uri  \n")
freeswitch.consoleLog("info",  param.. param1.." Accept  \n")
local session1=freeswitch.Session("user/testplivo1",session);
if (param1=="play") then
	session1:execute("playback","http://s3.amazonaws.com/plivocloud/Trumpet.mp3")
	session1:execute("playback","http://s3.amazonaws.com/plivocloud/Trumpet.mp3")
	session1:execute("playback","http://s3.amazonaws.com/plivocloud/Trumpet.mp3")
	session1:hangup()
elseif(param1=="conference") then
	freeswitch.consoleLog("info",  param.. param1.." Accept  \n")
	session1:execute("conference","$1@default")
else
	freeswitch.consoleLog("info",  " Error  \n")
end
