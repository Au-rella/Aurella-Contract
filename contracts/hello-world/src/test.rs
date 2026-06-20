#![cfg(test)]

use super::*;
use soroban_sdk::Env;

#[test]
fn test_increment() {
    let env = Env::default();
    let contract_id = env.register(StarterContract, ());
    let client = StarterContractClient::new(&env, &contract_id);

    assert_eq!(client.get_count(), 0);
    assert_eq!(client.increment(), 1);
    assert_eq!(client.increment(), 2);
    assert_eq!(client.get_count(), 2);
}
