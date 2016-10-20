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
    employees.map {|emp| emp.salary}.reduce(:+)
  end

  def total_salary_by
    array = []
    employees.each do |employee|
      array << employee.salary if yield(employee)
    end
    array.reduce(:+)
  end


end
