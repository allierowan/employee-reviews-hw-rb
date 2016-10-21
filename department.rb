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

  def satisfactory_performers
    self.employees.select { |emp| emp.satisfactory_performer? }
  end

  def department_raise(amount)
    good_perf_total_salary = self.total_salary_by { |emp| emp.satisfactory_performer? }
    raise_percent = amount.to_f / good_perf_total_salary.to_f
    self.satisfactory_performers.each do |employee|
      employee.give_raise(raise_percent)
    end
  end

  def ==(other)
    name == other.name
  end

end
