contract C {
    function f(uint256[] calldata x) external pure {
        x[:];
    }
}
// ----
// ParserError: (76-77): Expected primary expression.
