# RestAPI
All the scenarios related to Test Assignment are succesfully done with use of freeswitch, mod_lua, Lua ESL, mod verto(Rest API), mod shout(mp3)
Rest API scenario in this repository is done with form and no JSON and mod_verto did not give any option to get JSON body from request.

The outbound Rest scenario with JSON, demonstrating JSON extraction from REST call and JSON response is implemented at repostiory 
https://github.com/dhruvinFrndQ/Test/

This repository implements forllowign scenario
1) testplivo1 and testplivo2 configured as sip phones and registered
2)  inbound call play  and conference scenario.
3) Outbound play and confernee scenario with REST API (form)

Implementation
1) for inbound  play scenario mod_shout had been configured to play mp3 files
2) for inbound play scenario to capture channel_hangup_complete Lua ESL hook has been implemented in file 
/usr/share/freeswitch/scripts/hangup_event.lua and hook configuration lua.conf.xml
3) mod_curl is used to send CDR related to hangup etc to remote server
4) the mp3 is played using dialplan
5) inbound call scenari for confernce is implemnted using dialplan to answer the incoming call and adding incoming call to conference
6) cusotm evvent hook is configured in lua.conf.xml to get custom event related to conference event add_member and del_member. lua script
usr/share/freeswitch/scripts/custom_event.lua
7) on detecting add_member in conference oubound session towards testplivo2 is created and added to conference on answere
8)add_member and del_memeber CDR are forwarded to remote client using mod_curl
9) modules.conf.xml, verto.conf.xml, lua.conf.xml, default.xml are configured for respective scenarios
10) Rest API scenarios for outbound call are implemented with mod_verto by configuring lua script for given http request, verto.conf.xml 
configured for same.

For all inbound scenario testplivo1 and tesplivo2 should be registered and call intiated from testplivo1 to extension as defined in test assingment
for play or confernce scenario

11) Lua script usr/share/freeswitch/scripts/my_custom_api.lua has implemented the logic to check the serivce request in form parameters 
and accordingly execute Play or conference scenaio
12) following curl commands can be used to veriy the REST API scenario
curl -H 'Accept: application/json'  http://23.253.22.206:8081/api   -d "destination=testplivo1&service=conference" -X POST
curl -H 'Accept: application/json'  http://23.253.22.206:8081/api   -d "destination=testplivo1&service=play" -X POST
13) Event hooks are used to identify first user in conference to execute other outbound calls.


For Rest API (JSON ) outbound scenarios, idea was to use django (python) framework to process JSON and respond with json with integration of 
mod_python for call control on freeswitch. but freeswitch.py installation has missing module _freeSwictch.

so as failover succesfull REst API scenario is implemnted in this repository with form input using mod_verto on freeswitch


