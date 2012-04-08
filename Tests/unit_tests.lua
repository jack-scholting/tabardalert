-------------------------------------------------------------------------------
--	Author: siriusjs
--  Date: 4/8/12
--	Description: This file contains the unit tests for the TabardAlert addon. 
--      * These tests are run by the addon WoWUnit.
--      * To run: "/wowunit <test_suite_name>" (use while in-game)
-------------------------------------------------------------------------------

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