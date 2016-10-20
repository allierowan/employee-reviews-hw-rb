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

end
