%lang starknet
%builtins pedersen range_check

from starkware.starknet.common.syscalls import get_caller_address
from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.hash import hash2
from starkware.cairo.common.math import assert_le, assert_nn_le, unsigned_div_rem, assert_not_zero
from starkware.starknet.common.syscalls import storage_read, storage_write
from starkware.cairo.common.uint256 import (
    Uint256, uint256_add, uint256_sub, uint256_le, uint256_lt, uint256_check
)

## @title Greeting
## @description A minimalistic gm
## @description Mirrors gakonst's Dapptools-template https://github.com/gakonst/dapptools-template/blob/master/src/Greeter.sol
## @author Alucard <github.com/a5f9t4>

#############################################
##                METADATA                 ##
#############################################

@storage_var
func GREETING() -> (greeting: felt):
end

#############################################
##               CONSTRUCTOR               ##
#############################################

@constructor
func constructor{
    syscall_ptr: felt*,
    pedersen_ptr: HashBuiltin*,
    range_check_ptr
}(
    greeting: felt
):
    GREETING.write(greeting)
    return ()
end

#############################################
##                ACCESSORS                ##
#############################################

@view
func gm{
    syscall_ptr: felt*,
    pedersen_ptr: HashBuiltin*,
    range_check_ptr
}() -> (gm: felt):
    ## Manually fetch the caller address ##
    let (greeting: felt) = GREETING.read()
    return (gm=greeting)
end

#############################################
##                MUTATORS                 ##
#############################################

@external
func setGreeting{
    syscall_ptr: felt*,
    pedersen_ptr: HashBuiltin*,
    range_check_ptr
}(
    new_greeting: felt
):
    GREETING.write(new_greeting)
    return ()
end
