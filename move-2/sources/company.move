module 0x1::Company {
    use std::vector;

    const CONTRACT: address = @0x1;

    struct Employees has store, key, drop, copy {
        people: vector<Employee>
    }

    struct Employee has store, key, drop, copy {
        name: vector<u8>,
        age: u8,
        income: u64,
        posisition: vector<u8>,
    }

    fun create_employee(_employee: Employee, _employees: &mut Employees): Employee {
        let newEmployee = Employee{
            name: _employee.name,
            age: _employee.age,
            income: _employee.income,
            posisition: _employee.posisition,
        };

        vector::push_back(&mut _employees.people, _employee);

        newEmployee
    }

    fun add_bonus_income(_employee: Employee, _bonus: u64): Employee {
        _employee.income = _employee.income + _bonus;
        _employee
    }

    #[test]
    public fun test_create_employee() {
        let akmal = Employee {
            name: b"Akmal Dira",
            age: 21,
            income: 1000,
            posisition: b"Blockchain Developer",
        };

        let employees = Employees {
            people: (vector[akmal])
        };

        let createEmoployee = create_employee(akmal, &mut employees);
        assert!(createEmoployee.name == akmal.name, 0);
    }

    #[test]
    public fun test_add_bonus() {
        let akmal = Employee {
            name: b"Akmal Dira",
            age: 21,
            income: 1000,
            posisition: b"Blockchain Developer",
        };
        
        let addBonus = add_bonus_income(akmal, 200);
        assert!(addBonus.income == 1200, 0);
    }
}