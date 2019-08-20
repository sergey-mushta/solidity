pragma experimental SMTChecker;

contract C
{
	function f(uint x, bool b) public pure {
		require(x < 100);
		while (x < 10) {
			if (b)
				x = x + 1;
			else {
				x = 100;
				break;
			}
		}
		// Should fail because of the if.
		assert(x >= 50);
	}
}
// ----
// Warning: (233-248): Assertion violation happens here
