contract C {
    function f() public returns (uint[] memory, uint) {
        try this.f() returns (uint[] memory a, uint b) {

        } catch {

        }
    }
}