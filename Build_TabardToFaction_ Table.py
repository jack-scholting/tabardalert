# This python script uses Blizzard's Web API to construct a Lua table 
# 	relating every tabard ID to the respective faction id.

# Import the libraries you need.
import requests	# Must download from PyPi. Also needs certifi.
import json

# Get the Id of every tabard.
tabardIdList = [65907, 45574, 43154]

# Get the information for that tabard, extract the faction id.
host = "https://us.battle.net/api/wow/item/"
table = {}
for tabard in tabardIdList:
	# Build the URL for the request.
	URL = host + str(tabard)
	
	# Send the request.
	r = requests.get(URL)

	# Decode the JSON
	decoded_json = json.loads(r.text)
	
	# Save the faction 
	table[tabard] = decoded_json["minFactionId"]
	
# Build the Lua table from it.
print table

with open('lua_table', 'w') as f:
	f.write(table)

