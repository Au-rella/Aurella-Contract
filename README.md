# Aurella — Contracts

Minimal Soroban (Stellar) smart contract starter for the Fashion Hub project.
A simple counter contract to prove the toolchain works — extend it with real
on-chain logic (e.g. product authenticity, ownership records) via open issues.

Pairs with:
- [fashion-hub-frontend](../fashion-hub-frontend)
- [fashion-hub-backend](../fashion-hub-backend)

## Prerequisites

1. **Rust**: https://rustup.rs
   ```bash
   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.org | sh
   rustup target add wasm32-unknown-unknown
   ```
2. **Stellar CLI**:
   ```bash
   cargo install --locked stellar-cli --features opt
   ```

## Build & test

```bash
cd contracts/hello-world
stellar contract build
cargo test
```

## Deploy to testnet

```bash
./deploy.sh
```

This prints a Contract ID and an explorer link in the form:
```
https://stellar.expert/explorer/testnet/contract/<CONTRACT_ID>
```

No local Rust setup? Use GitHub Codespaces — open this repo in a Codespace and run the
commands above with zero local install.

## Project structure

```
contracts/
  hello-world/
    src/
      lib.rs    # contract logic
      test.rs   # unit tests
    Cargo.toml
deploy.sh        # one-command testnet deploy
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) and pick an issue.
