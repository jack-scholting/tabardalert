-------------------------------------------------------------------------------
--  Author: siriusjs
--  Date: 4/8/12
--  Description: This file contains the unit tests for the TabardAlert addon. 
--      * These tests are run by the addon WoWUnit.
--      * To run: "/wowunit <test_suite_name>" (use while in-game)
-------------------------------------------------------------------------------

local Test_ApiCallFail = {

    mocks = {
    	GetInstanceInfo = function()
    	    return nil
    	end;
    	GetInventoryItemID = function()
    	    return nil
    	end;
        GetFactionInfoByID = function()
            return nil
        end;
    };
        
    test_inReputationPossibleLocation = function()
	    assert(inReputationPossibleLocation() == false, "Expected location to be false.");
    end;
    
    test_getTabardFaction = function()
	    assert(getTabardFaction() == nil, "Expected tabard faction to be nil"); 
    end;
    
    test_isExalted = function()
        assert(isExalted( 72 ) == false, "Expected player to not be exalted for an unknown faction");
    end;
	
}
WoWUnit:AddTestSuite("Test_ApiCallFail", Test_ApiCallFail)

