# Employee Reviews Homework
Contains three classes: Department, Employee, and DataStore. DataStore is meant to hold and interact with the employee and department data.

## Employee Usage
```ruby
kvothe = Employee.new("Kvothe Kingkiller", "kote@theinn.com", "301-555-1234", 50000)

kvothe.name #=> "Kvothe Kingkiller"

kvothe.add_review("He's a bit precocious")
kvothe.review #=> "He's a bit precocious". this also checks for a negative review with natural language processing and updates satisfactory_performance
kvothe.satisfactory_performance #=> true is the default value

kvothe.give_raise(0.1)
kvothe.salary #=> 55000
```

## Department Usage
```ruby
arcanists = Department.new("Arcanists")

arcanists.add_employee(kvothe)
arcanists.employees = [kvothe]

arcanists.department_raise(1000) #=> distributes raises to employees who have been performing satisfactorily
```
## DataStore Usage
```ruby
database = DataStore.new() #=> looks for any existing data and loads it in
database.employees #=> []
database.departments #=> []

database.add(kvothe) #=> adds to employees array
database.add(arcanists) #=> adds to departments array
database.deep_save #=> saves the data out to a file. next time you initialize, it will be loaded
```
