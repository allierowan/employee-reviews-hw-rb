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

end
