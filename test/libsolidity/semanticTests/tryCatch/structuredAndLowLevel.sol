contract C {
    function g(bool b) public pure returns (uint, uint) {
        require(b);
        return (1, 2);
    }
    function f(bool b) public returns (uint x, uint y, bytes memory txt) {
        try this.g(b) returns (uint a, uint b) {
            (x, y) = (a, b);
        } catch Error(string memory s) {
            x = 99;
            txt = s;
        } catch (bytes memory s) {
            x = 98;
            txt = s;
        }
    }
}
// ----
// f(bool): true -> 1, 2
// f(bool): false -> 9, 10
