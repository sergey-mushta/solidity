pragma experimental SMTChecker;

contract C
{
	function f(uint x, bool b) public pure {
		require(x < 100);
		while (x < 10) {
			if (b)
				x = 200;
			else {
				x = 100;
				break;
			}
		}
		// Should be safe, but for now it fails due to break
		// being unsupported and erasing all knowledge.
		assert(x >= 50);
	}
}
// ----
// Warning: (300-315): Assertion violation happens here
