require 'csv'
require_relative './employee'
require_relative './department'

class DataStore

  def initialize

    if File.exists?("./data/employees.csv")
      employee_array = CSV.read("./data/employees.csv")
      @employees = employee_array[0].map { |hash|
        Employee.new(eval(hash)[:name], eval(hash)[:email], eval(hash)[:phone], eval(hash)[:salary], eval(hash)[:review], eval(hash)[:satisfactory_performance])
      }
    else
      @employees = []
    end

    if File.exists?("./data/departments.csv")
      department_array = CSV.read("./data/departments.csv")
      depts = []
      department_array[0].each do |hash|
        department_hash = eval(hash)
        name = department_hash[:name]
        employees = department_hash[:employees].map { |empl_hash| get(:employees, :email, empl_hash[:email])[0]}
        depts << Department.new(name, employees)
      end
      @departments = depts
    else
      @departments = []
    end

  end

  attr_accessor :employees, :departments

  def all(key=nil)
    return { employees: employees, departments: departments } unless key
    send(key) if key
  end

  def add(object)
    if object.is_a? Employee
      employees << object
    else
      departments << object
    end
  end

  def get(type, key, value)
      send(type).select { |object| object.send(key) == value }
  end

  def deep_save
    employee_data = employees.map{ |employee| employee.to_hash }.to_csv
    employee_array = []
    department_data = departments.map { |department|
      employee_array = department.employees.map { |employee| employee.to_hash }
      { name: department.name, employees: employee_array }}.to_csv
    File.open('./data/employees.csv', 'w') {|f| f.write(employee_data) }
    File.open('./data/departments.csv', 'w') {|f| f.write(department_data) }

  end

end
