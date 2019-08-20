pragma experimental SMTChecker;

contract Simple {
	uint[] a;
	function f(uint n) public {
		uint i;
		while (i < n)
		{
			a[i] = i;
			++i;
		}
		require(n > 1);
		assert(a[n-1] > a[n-2]);
	}
}
