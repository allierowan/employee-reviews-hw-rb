require_relative './employee'
require_relative './department'

class DataStore

  def initialize
    @employees = []
    @departments = []
  end

  attr_accessor :employees, :departments

  def all
    { employees: employees, departments: departments }
  end

end
