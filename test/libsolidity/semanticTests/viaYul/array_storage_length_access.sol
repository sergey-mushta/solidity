contract C {
	uint[] storageArray;
	function set_get_length(uint256 len) public returns (uint256)
	{
        for (uint i = 0; i < len; i++)
		    storageArray.push(0);
		return storageArray.length;
	}

}
// ====
// compileViaYul: true
// ----
// set_get_length(uint256): 0 -> 0
// set_get_length(uint256): 1 -> 1
// set_get_length(uint256): 10 -> 10
// set_get_length(uint256): 20 -> 20
// set_get_length(uint256): 0 -> 0
// set_get_length(uint256): 0xFF -> 0xFF
// set_get_length(uint256): 0xFFFF -> 0xFFFF
