require 'minitest/autorun'
require 'minitest/pride'
require_relative '../employee'

class EmployeeTest <Minitest::Test

  def test_employee_exists
    assert Employee
  end

  def test_create_employee
    employee_1 = Employee.new( "Kvothe Kingkiller", "kvothe@theuniversity.com", "777-555-7777", 40000)
    assert_equal "Kvothe Kingkiller", employee_1.name
  end

end
