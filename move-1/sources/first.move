module 0x1::SocialNetwork {
    // use std::debug;
    use std::vector;

    struct Friend has store, key, drop {
        people: vector<Person>
    }

    struct Person has store, key, drop, copy {
        name: vector<u8>,
        age: u8, 
    }

    public fun create_friend(myFriend: Person, friends: &mut Friend): Person {
        let newFriend = Person {
            name: myFriend.name,
            age: myFriend.age,
        };
        
        vector::push_back(&mut friends.people, myFriend);
        newFriend
    }

    #[test]
    public fun test_create_friend() {
        let akmal = Person {
            name: b"Akmal Dira",
            age: 21,
        };

        let friends = Friend {
            people: (vector[akmal])
        };

        let createFriend = create_friend(akmal, &mut friends);
        assert!(createFriend.name == b"Akmal Dira", 0);
    }
}