module counter::simple_counter {
    use std::signer;


    struct CounterHolder has key {
        count: u64
    }

    public entry fun init_account(account: signer) acquires CounterHolder {
        let addr = signer::address_of(&account);
        if (!exists<CounterHolder>(&addr)) {
            move_to(&account, CounterHolder{
                count: 0
            })
        } else {
            let old_count = borrow_global_mut<CounterHolder>(addr);
            old_count.count = old_count.count + 1;
        }
    }

}