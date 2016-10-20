require 'minitest/autorun'
require 'minitest/pride'
require_relative '../department'

class DepartmentTest <Minitest::Test

  def test_department_exists
    assert Department
  end

  def test_create_department
    dev_dept = Department.new("Development")
    assert_equal "Development", dev_dept.name
  end

  def test_department_has_employees
    dev_dept = Department.new("Development")
    assert_equal [], dev_dept.employees
  end

  def test_add_employee_to_dept
    aurors = Department.new("Aurors")
    harry_potter = Employee.new("Harry Potter", "hpotter@hogwarts.com", "303-555-1234", 60000)
    aurors.add_employee(harry_potter)
    assert aurors.employees[0].is_a? Employee
  end

end
