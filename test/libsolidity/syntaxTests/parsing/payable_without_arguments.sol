contract C {
	function f() public pure {
		address payable q = payable;
	}
}
// ----
// ParserError: (70-71): Expected address to be converted to address payable.
