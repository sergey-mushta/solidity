contract c {
    uint[] storageArray;
    function f() public {
        storageArray.length = 3;
    }
}
// ----
// TypeError: (72-91): Expression has to be an lvalue.
