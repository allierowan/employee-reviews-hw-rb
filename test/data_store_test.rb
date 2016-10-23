require 'minitest/autorun'
require 'minitest/pride'
require_relative '../data_store'

class DataStoreTest < Minitest::Test

  # need to remove the data files to ensure a clean test environment
  File.delete('./data/departments.csv') if File.exists?('./data/departments.csv')
  File.delete('./data/employees.csv') if File.exists?('./data/employees.csv')

  i_suck_and_my_tests_are_order_dependent!()

  def test_data_store_exists
    assert DataStore
  end

  def test_data_store_accesses_all_data
    company = DataStore.new
    new_hash = { employees: [], departments: [] }
    assert_equal new_hash, company.all
  end

  def test_data_store_accesses_all_data_with_data
    company = DataStore.new

    allie = Employee.new("Allie Rowan", "aileen.s.rowan@gmail.com", "301-332-5350", 1000000000)
    dave = Employee.new("Bighaus", "dave@gmail.com", "301-555-1234", 1)
    company.add(allie)
    company.add(dave)
    new_hash = { employees: [allie, dave], departments: [] }
    assert_equal new_hash, company.all
  end

  def test_get_all_employees
    company = DataStore.new
    assert_equal [], company.all(:employees)
  end

  def test_add_employee
    company = DataStore.new
    allie = Employee.new("Allie Rowan", "aileen.s.rowan@gmail.com", "301-332-5350", 1000000000)
    company.add(allie)
    assert_equal [allie], company.all(:employees)
  end

  def test_add_department
    company = DataStore.new
    cool_kids = Department.new("Cool Kids")
    company.add(cool_kids)
    assert_equal [cool_kids], company.all(:departments)
  end

  def test_get_employee_by_name
    company = DataStore.new
    allie = Employee.new("Allie Rowan", "aileen.s.rowan@gmail.com", "301-332-5350", 1000000000)
    dave = Employee.new("Bighaus", "dave@gmail.com", "301-555-1234", 1)
    company.add(dave)
    company.add(allie)
    assert_equal [allie], company.get(:employees, :name, "Allie Rowan")
  end

  def test_get_department_by_name
    company = DataStore.new
    cool_kids = Department.new("Cool Kids")
    company.add(cool_kids)
    assert_equal [cool_kids], company.get(:departments, :name, "Cool Kids")
  end

  def test_get_department_by_name_no_match
    company = DataStore.new
    sick_peeps = Department.new("Sick Peeps")
    company.add(sick_peeps)
    assert_equal [], company.get(:departments, :name, "Cool Kids")
  end

  def test_get_employee_by_email
    company = DataStore.new
    allie = Employee.new("Allie Rowan", "aileen.s.rowan@gmail.com", "301-332-5350", 1000000000)
    dave = Employee.new("Bighaus", "dave.casagrande@gmail.com", "301-555-1234", 1)
    company.add(allie)
    company.add(dave)
    assert_equal [allie], company.get(:employees, :email, "aileen.s.rowan@gmail.com")
  end

  def test_save_to_file
    company = DataStore.new
    allie = Employee.new("Allie Rowan", "aileen.s.rowan@gmail.com", "301-332-5350", 1000000000, "She is AWESOME")
    dave = Employee.new("Bighaus", "dave.casagrande@gmail.com", "301-555-1234", 1, "He's okay...")
    company.add(allie)
    company.add(dave)
    cool_kids = Department.new("Cool Kids")
    cool_kids.add_employee(allie)
    cool_kids.add_employee(dave)
    company.add(cool_kids)
    company.deep_save
  end

  def test_zdata_persisted
    company = DataStore.new
    allie = Employee.new("Allie Rowan", "aileen.s.rowan@gmail.com", "301-332-5350", 1000000000, "She is AWESOME")
    dave = Employee.new("Bighaus", "dave.casagrande@gmail.com", "301-555-1234", 1, "He's okay...")
    cool_kids = Department.new("Cool Kids")
    cool_kids.add_employee(allie)
    cool_kids.add_employee(dave)
    new_hash = { employees: [allie, dave], departments: [cool_kids] }
    assert_equal new_hash, company.all
  end

end
