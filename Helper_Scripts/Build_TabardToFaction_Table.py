# This python script uses Blizzard's Web API to construct a Lua table 
# 	relating every tabard ID to the respective faction id.

# Import the libraries you need.
import requests	# Must download from PyPi. Also needs certifi.
import json

# Get the Id of every tabard.
# This list was obtained from the addon TabardMaster.
tabardIdList = [45574, 45577, 45578, 45579, 45580, 45581, 45582, 45583, 45584, 45585, 64882, 64884, 23999, 24004, 31773, 31774, 31775, 
    31776, 31777, 31778, 31779, 31780, 31781, 31804, 32445, 32828, 35221, 43154, 43155, 43156, 43157, 65904, 65905, 65906, 65907, 65908, 
    65909, 15196, 15197, 15198, 15199, 19031, 19032, 19160, 19505, 19506, 20131, 20132, 36941, 43349, 45983, 49052, 49054, 49086, 51534, 
    63378, 63379, 5976,  69209, 69210, 22999, 23192, 23705, 23709, 24344, 25549, 28788, 31279, 38310, 38311, 38309, 38312, 38313, 38314, 
    31404, 31405, 35279, 35280, 40643, 43300, 43348, 46817, 46818, 46874, 52252, 11364, 56246, 64310, ]                

# Get the information for that tabard, extract the faction id.
host = "https://us.battle.net/api/wow/item/"
table = {}
count = 0
for tabard in tabardIdList:
    # Build the URL for the request.
    URL = host + str(tabard)

    # Send the request.
    r = requests.get(URL)

    # Decode the JSON
    decoded_json = json.loads(r.text)

    # Save the faction 
    table[tabard] = decoded_json["minFactionId"]
    
    print(count)
    count = count +1
	
# Build the Lua table from it.   
print table

# with open('lua_table', 'w') as f:
	# f.write(table)

