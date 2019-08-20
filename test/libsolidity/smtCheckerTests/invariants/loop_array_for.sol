pragma experimental SMTChecker;

contract Simple {
	uint[] a;
	function f(uint n) public {
		uint i;
		for (i = 0; i < n; ++i)
			a[i] = i;
		require(n > 1);
		assert(a[n-1] > a[n-2]);
	}
}
