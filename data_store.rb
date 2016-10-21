require_relative './employee'
require_relative './department'

class DataStore

  def initialize
    @employees = []
    @departments = []
  end

  attr_accessor :employees, :departments

  def all(key=nil)
    return { employees: employees, departments: departments } unless key
    send(key) if key
  end

  def add(key, hash)
    if key == :employees
      employees << Employee.new(hash[:name], hash[:email], hash[:phone], hash[:salary])
    elsif key == :departments
      departments << Department.new(hash[:name])
    end
  end

end
