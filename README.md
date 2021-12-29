# cairostarter • [![Tests](https://github.com/a5f9t4/cairostarter/actions/workflows/tests.yml/badge.svg)](https://github.com/a5f9t4/cairostarter/actions/workflows/tests.yml) [![Lints](https://github.com/a5f9t4/cairostarter/actions/workflows/lints.yml/badge.svg)](https://github.com/a5f9t4/cairostarter/actions/workflows/lints.yml) ![GitHub](https://img.shields.io/github/license/a5f9t4/cairostarter) ![GitHub package.json version](https://img.shields.io/github/package-json/v/a5f9t4/cairostarter)


**Forkable**, **Minimal** Template for Starknet Projects.

## Directory Structure

```ml
contracts
├─ Greeter — "An example greeter contract"
├─ interfaces
│  ├─ IAccount — "Account Interface"
│  ├─ IAggregatorV3 — "Chainlink V3 Aggregator Interface"
│  ├─ IERC20 — "ERC20 Contract Interface"
│  ├─ IERC165 — "ERC165 Contract Interface"
│  ├─ IERC721 — "ERC721 Contract Interface"
│  └─ IERC1155 — "ERC1155 Contract Interface"
├─ utils
│  ├─ Account — "Stripped account"
│  ├─ Ownable — "Minimal, ownable contract instance"
│  ├─ Context — "Port of OZ's Solidity Context Abstraction"
│  └─ Pausible — "Pausible Solidity Functionality"
tests
└─ test_Greeter — "Test Script for the Greeter Contract"
```

## Installation

### First time?

Further installation instructions provided in the [cairo-lang docs](https://www.cairo-lang.org/docs/quickstart.html)

Before installing Cairo on your machine, you need to install `gmp`:
```bash
sudo apt install -y libgmp3-dev # linux
brew install gmp # mac
```
> If you have any troubles installing gmp on your Apple M1 computer, [here’s a list of potential solutions](https://github.com/OpenZeppelin/nile/issues/22).

For VSCode support:

Download `cairo-0.6.2.vsix` from https://github.com/starkware-libs/cairo-lang/releases/tag/v0.6.2

And run:
```bash
code --install-extension cairo-0.6.2.vsix
```

### Set up the project

Clone the repository

```bash
git clone git@github.com:a5f9t4/cairostarter.git
```

`cd` into it and create a Python virtual environment:

```bash
cd cairostarter
python3 -m venv env
source env/bin/activate
```

### Nile

Install the [Nile](https://github.com/OpenZeppelin/nile) dev environment and then run `install` to get [the Cairo language](https://www.cairo-lang.org/docs/quickstart.html), a [local network](https://github.com/Shard-Labs/starknet-devnet/), and a [testing framework](https://docs.pytest.org/en/6.2.x/).
```bash
pip3 install cairo-nile
nile install
```

## Usage

### Compile the contracts

```bash
nile compile
```

### Run tests

```bash
pytest
```


## Acknowledgements

- [cairomate](https://github.com/a5f9t4/cairomate)
- [StarkWare](https://starkware.co/)
- [OpenZeppelin](https://github.com/OpenZeppelin/cairo-contracts)
- [DappTools Template](https://github.com/gakonst/dapptools-template)

## Security

This project is still in a very early and experimental phase. It has never been audited nor thoroughly reviewed for security vulnerabilities. Do not use in production.

Please report any security issues you find by opening up an issue in this reposisitory.

## License

Cairostarter Contracts are released under the [AGPL-3.0-only](LICENSE).