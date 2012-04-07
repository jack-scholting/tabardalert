 local Test_isExalted = {
	
	mocks = {
		UnitName = function()
			return "Soandso";
		end;
        GetFactionInfoByID = function()
            return 8
        end;
	};
	
	setUp = function()
		return {};
	end;

	tearDown = function()
 		-- no tear down required
	end;
	
	testExample = function()
		assert(UnitName("player") == "Soandso", "Expected player name to be 'Soandso'");
	end;
	
	testFailure = function()
		assert(UnitName("player") == "Feithar", "Expected player name to be 'Feithar'");
	end;
    
    testPlayerIsExalted = function()
        assert(isExalted( factionId ) == false, "Expected player to be exalted");
    end;
	
}