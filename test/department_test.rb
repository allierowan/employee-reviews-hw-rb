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

  def test_get_department_salary
    aurors = Department.new("Aurors")
    harry_potter = Employee.new("Harry Potter", "hpotter@hogwarts.com", "303-555-1234", 60000)
    ron_weasley = Employee.new("Ronald Weasley", "rweasley@hogwarts.com", "303-555-9393", 59999)
    aurors.add_employee(harry_potter)
    aurors.add_employee(ron_weasley)
    assert_equal 119999, aurors.total_salary
  end

end
