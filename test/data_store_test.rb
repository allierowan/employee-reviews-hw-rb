require 'minitest/autorun'
require 'minitest/pride'
require_relative '../data_store'

class DataStoreTest < Minitest::Test

  def test_data_store_exists
    assert DataStore
  end

  def test_data_store_accesses_all_data
    company = DataStore.new
    new_hash = { employees: [], departments: [] }
    assert_equal new_hash, company.all
  end

  def test_get_all_employees
    company = DataStore.new
    assert_equal [], company.all(:employees)
  end

  def test_add_employee
    company = DataStore.new
    company.add(:employees, {name: "Allie Rowan", email: "aileen.s.rowan@gmail.com", phone: "301-332-5350", salary: 1000000000})
    allie = Employee.new("Allie Rowan", "aileen.s.rowan@gmail.com", "301-332-5350", 1000000000)
    assert_equal [allie], company.all(:employees)
  end

  def test_add_department
    company = DataStore.new
    company.add(:departments, name: "Cool Kids")
    cool_kids = Department.new("Cool Kids")
    assert_equal [cool_kids], company.all(:departments)
  end

end
