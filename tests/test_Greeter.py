import pytest
import asyncio
from starkware.starknet.testing.starknet import Starknet
from utils import Signer, uint, str_to_felt, MAX_UINT256

signer = Signer(123456789987654321)


@pytest.fixture(scope='module')
def event_loop():
    return asyncio.new_event_loop()


@pytest.fixture(scope='module')
async def ownable_factory():
    starknet = await Starknet.empty()
    owner = await starknet.deploy(
        "contracts/utils/Account.cairo",
        constructor_calldata=[signer.public_key]
    )

    greeter = await starknet.deploy(
        "contracts/Greeter.cairo",
        constructor_calldata=[
            str_to_felt("gm everybody, gm")
        ]
    )
    return starknet, greeter, owner


@pytest.mark.asyncio
async def test_constructor(ownable_factory):
    _, greeter, _ = ownable_factory
    expected = await greeter.gm().call()
    assert expected.result.gm == str_to_felt("gm everybody, gm")

@pytest.mark.asyncio
async def test_set_greeting(ownable_factory):
    _, greeter, owner = ownable_factory
    new_greeting = str_to_felt("gtgm")
    await signer.send_transaction(owner, greeter.contract_address, 'setGreeting', [new_greeting])
    expected = await greeter.gm().call()
    assert expected.result.gm == new_greeting
