sudo_GTR = dofile("sudo.lua")
https = require("ssl.https")
JSON = dofile("./libs/JSON.lua")
local GTR_dev = io.open("GTR_online.lua")
if GTR_dev then
GTR_on = {string.match(GTR_dev:read('*all'), "^(.*)/(%d+)")}
local tsheke_file = io.open("sudo.lua", 'w')
tsheke_file:write("token = '" ..GTR_on[1].."'\n\nsudo_add = "..GTR_on[2].."" )
tsheke_file:close()
https.request("https://api.telegram.org/bot"..GTR_on[1].."/sendMessage?chat_id="..GTR_on[2].."&text=Bot_GTR_is_start_new")
os.execute('cd .. && rm -rf .telegram-cli')
os.execute('rm -rf GTR_online.lua')  
os.execute('./tg -s ./GTR.lua $@ --bot='..GTR_on[1])
end
function chack(tokenCk)
local getme = "https://api.telegram.org/bot" ..tokenCk.. '/getme'
local req = https.request(getme)
local data = JSON:decode(req)
if data.ok == true then
print("\27[31m✓ DONE\27[m \27[1;34m»»Now Send Sudo ID««\27[m")
local sudo_send  = io.read()
print("\27[31m✓ DONE\27[m")
local tsheke_file = io.open("sudo.lua", 'w')
tsheke_file:write("token = '" ..tokenCk.."'\n\nsudo_add = "..sudo_send.."" )
tsheke_file:close()
os.execute('cd .. && rm -fr .telegram-cli')
os.execute('cd && rm -fr .telegram-cli')
os.execute('./tg -s ./GTR.lua $@ --bot='..tokenCk)
else
print("\27[31m»»This TOKEN Incorrect , Send Right TOKEN««\27[m")
local token_send = io.read()
chack(token_send)
end
end
os.execute('cd .. && rm -rf .telegram-cli')
if token and token == "TOKEN" then 
print("\27[1;34m»»Send Your Bot TOKEN««\27[m")
local token_send = io.read()
chack(token_send)
else 
os.execute('cd .. && rm -fr .telegram-cli')
os.execute('cd && rm -fr .telegram-cli')
sudo_GTR = dofile("sudo.lua")
local getme = "https://api.telegram.org/bot" ..token.. '/getme'
local req = https.request(getme)
local data = JSON:decode(req)
if data.ok == true then
os.execute('./tg -s ./GTR.lua $@ --bot='..token)
else
print("\27[31mTOKEN Incorrect , Send Right TOKEN««\27[m")
local token_send = io.read()
chack(token_send)
end
end
