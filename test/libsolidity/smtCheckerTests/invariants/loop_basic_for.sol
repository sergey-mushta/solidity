pragma experimental SMTChecker;

contract Simple {
    function f(uint x) public {
		uint y;
		for (y = 0; y < x; ++y) {}
        assert(y == x);
    }
}
// ----
// Warning: (55-151): Function state mutability can be restricted to pure
