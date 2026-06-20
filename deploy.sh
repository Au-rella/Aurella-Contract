#!/usr/bin/env bash
# Builds and deploys the starter contract to Stellar Testnet.
# Prerequisites: rustup + stellar-cli installed. See README.md.

set -e

NETWORK="testnet"
SOURCE_ACCOUNT="fashion-hub-deployer"

echo "==> Adding wasm32 target (if missing)"
rustup target add wasm32-unknown-unknown

echo "==> Building contract"
cd "$(dirname "$0")/contracts/hello-world"
stellar contract build

WASM_PATH="../../target/wasm32-unknown-unknown/release/hello_world.wasm"

echo "==> Creating/funding identity (testnet) if it doesn't exist"
stellar keys generate "$SOURCE_ACCOUNT" --network "$NETWORK" --fund || true

echo "==> Deploying to $NETWORK"
CONTRACT_ID=$(stellar contract deploy \
  --wasm "$WASM_PATH" \
  --source "$SOURCE_ACCOUNT" \
  --network "$NETWORK")

echo ""
echo "=========================================="
echo "Deployed! Contract ID: $CONTRACT_ID"
echo "Explorer link:"
echo "https://stellar.expert/explorer/testnet/contract/$CONTRACT_ID"
echo "=========================================="
