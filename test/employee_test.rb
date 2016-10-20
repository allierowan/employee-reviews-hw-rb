require 'minitest/autorun'
require 'minitest/pride'
require_relative '../employee'

class EmployeeTest <Minitest::Test

  def test_employee_exists
    assert Employee
  end

end
