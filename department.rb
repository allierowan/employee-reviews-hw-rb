require './employee'

class Department

  attr_reader :name
  attr_accessor :employees

  def initialize(name)
    @name = name
    @employees = []
  end

  def add_employee(employee)
    employees << employee
  end

  def total_salary
    employees.map {|employee| employee.salary}.reduce(:+)
  end

end
